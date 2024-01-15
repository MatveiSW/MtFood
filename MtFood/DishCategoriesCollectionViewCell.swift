//
//  DishCategoriesCollectionViewCell.swift
//  MtFood
//
//  Created by Матвей Авдеев on 15.01.2024.
//

import UIKit

class DishCategoriesCollectionViewCell: UICollectionViewCell {
        
    private lazy var dishCategoryLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17)
        label.text = "Все меню"
        label.textColor = UIColor(named: "categoriesButtonColor")
        label.textAlignment = .center
        
        return label
    }()
    
    var isSelectedCell: Bool = false {
        didSet {
            
            dishCategoryLabel.font = isSelectedCell ? .boldSystemFont(ofSize: 17) : .systemFont(ofSize: 17)
            dishCategoryLabel.textColor = isSelectedCell ? UIColor(named: "priceButtonColor") : UIColor(named: "categoriesButtonColor")
            
            contentView.backgroundColor = isSelectedCell ? UIColor(named: "selectedCellColor") : .clear
            contentView.layer.borderColor = isSelectedCell ? UIColor.clear.cgColor : UIColor(named: "categoriesButtonColor")?.cgColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settingContentView()
        setupConstaints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func settingContentView() {
        contentView.layer.borderColor = UIColor(named: "categoriesButtonColor")?.cgColor
        contentView.layer.borderWidth = 2
        contentView.layer.cornerRadius = 20
    }
    
    func configure(teg: String) {
        dishCategoryLabel.text = teg
    }
    
    private func setupConstaints() {
        contentView.addSubview(dishCategoryLabel)
        
        NSLayoutConstraint.activate(
            [
                dishCategoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                dishCategoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                dishCategoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                dishCategoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
                
            ]
        )
    }
}
