//
//  FoodListViewController.swift
//  MtFood
//
//  Created by Матвей Авдеев on 15.01.2024.
//

import UIKit
import RealmSwift

class FoodListViewController: UIViewController {
    
    let mockStorage = MockStorage.shared
    let networkManager = NetworkManager.shared
    let dataManager = DataManager.shared
    
    let bannerIdentifier = "banner"
    let categoriesIdentifier = "categories"
    let dishListIdentifier = "dish"
    
    var uniqueTegs: [String] = []
    var selectedTeg = "Все меню"
    
    var dishList: Dishes?
    var filteredDishes: [Dish] = []
    
    var dishesRealm: Results<DishesRealm>!
    
    lazy var bannerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.minimumLineSpacing = 20
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.delegate = self
        collection.dataSource = self
        collection.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: bannerIdentifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = UIColor(named: "backgroundColor")
        
        return collection
    }()
    
    lazy var dishCategoriesCollectionView: UICollectionView =  {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = CGSize(width: 150, height: 40)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(DishCategoriesCollectionViewCell.self, forCellWithReuseIdentifier:  categoriesIdentifier)
        collection.backgroundColor = UIColor(named: "backgroundColor")
        
        return collection
    }()
    
    lazy var dishListTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(DishListTableViewCell.self, forCellReuseIdentifier: dishListIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.layer.cornerRadius = 20
        tableView.backgroundColor = .white
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        settingNavigationBar()
        
        setup(views: bannerCollectionView, dishCategoriesCollectionView, dishListTableView)
        setupConstraints()
        
        fetchDishes()
        
        dishesRealm = dataManager.realm.objects(DishesRealm.self)
        updateUIFromRealm()
        
    }
    
    func fetchDishes() {
        networkManager.fetch(Dishes.self, withUrl: Link.dish.url) { [weak self] dishes in
            switch dishes {
            case .success(let dishesData):
                self?.dishList = dishesData
                self?.filteredDishes = dishesData.dishes
                
                let uniqueTegsSet = Set(dishesData.dishes.flatMap { $0.tegs })
                
                self?.uniqueTegs = Array(uniqueTegsSet.sorted())
                self?.saveDishes()
                
                DispatchQueue.main.async {
                    self?.dishListTableView.reloadData()
                    self?.dishCategoriesCollectionView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func saveDishes() {
        if dataManager.realm.objects(DishesRealm.self).isEmpty {
            let dishesRealm = DishesRealm()
            
            for dish in filteredDishes {
                let dishRealm = DishRealm()
                
                dishRealm.name = dish.name
                dishRealm.price = dish.price
                dishRealm.descriptionDish = dish.description
                dishRealm.imageUrl = dish.imageUrl
                dishRealm.tegs.append(objectsIn: dish.tegs)
                dishesRealm.dishes.append(dishRealm)
            }
            dataManager.save(dishesRealm: dishesRealm)
        }
    }
    
    func updateUIFromRealm() {
        let savedDishes = dataManager.realm.objects(DishesRealm.self)
        
        if !savedDishes.isEmpty {
            let dishesRealm = savedDishes.first!
            
            filteredDishes = dishesRealm.dishes.map { dishRealm in
                Dish(
                    name: dishRealm.name,
                    price: dishRealm.price,
                    description: dishRealm.descriptionDish,
                    imageUrl: dishRealm.imageUrl,
                    tegs: Array(dishRealm.tegs)
                )
            }
            
            DispatchQueue.main.async {
                self.dishListTableView.reloadData()
                self.dishCategoriesCollectionView.reloadData()
            }
        }
    }
    
    private func setup(views: UIView...) {
        views.forEach { newView in
            view.addSubview(newView)
        }
    }
    
    private func settingNavigationBar() {
        
        let barButtonImage = UIImageView()
        barButtonImage.image = UIImage(named: "downIcon")
        
        let barButtonLabel = UILabel()
        barButtonLabel.text = "Москва"
        
        navigationItem.leftBarButtonItems =
        [
            UIBarButtonItem(customView: barButtonLabel),
            UIBarButtonItem(customView: barButtonImage)
        ]
        
        navigationItem.titleView?.tintColor = .black
    }
    
}


