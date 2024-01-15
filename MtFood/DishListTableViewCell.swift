//
//  DishListTableViewCell.swift
//  MtFood
//
//  Created by Матвей Авдеев on 15.01.2024.
//

import UIKit

class DishListTableViewCell: UITableViewCell {
    
    let networkManager = NetworkManager.shared
    
    lazy var dishImageView: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var dishNameLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var dishDescriptionLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var dishPriceButton: UIButton = {
        let button = UIButton(configuration: .plain())
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor(named: "priceButtonColor")?.cgColor
        button.layer.borderWidth = 2
        button.backgroundColor = .clear
        button.layer.cornerRadius = 10
        button.tintColor = UIColor(named: "priceButtonColor")
        
        return button
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        setup(views: dishImageView, dishNameLabel, dishDescriptionLabel, dishPriceButton)
        setupConstarints()
        
    }
    
    func configure(dish: Dish?) {
        
        dishNameLabel.text  = dish?.name
        dishDescriptionLabel.text = dish?.description
        dishPriceButton.setTitle("от \(dish?.price ?? 345) р", for: .normal)
        
        guard let dishUrl = URL(string: dish?.imageUrl ?? "") else { return }
        
        networkManager.fetchImage(withUrl: dishUrl, andImage: dishImageView)
    }
    
    private func setup(views: UIView...) {
        views.forEach { newView in
            contentView.addSubview(newView)
        }
    }
    
    private func setupConstarints() {
        NSLayoutConstraint.activate(
            [
                dishImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                dishImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                dishImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
                dishImageView.widthAnchor.constraint(equalTo: dishImageView.heightAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                dishNameLabel.topAnchor.constraint(equalTo: dishImageView.topAnchor),
                dishNameLabel.leadingAnchor.constraint(equalTo: dishImageView.trailingAnchor, constant: 20),
                dishNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                dishDescriptionLabel.topAnchor.constraint(equalTo: dishNameLabel.bottomAnchor, constant: 10),
                dishDescriptionLabel.leadingAnchor.constraint(equalTo: dishImageView.trailingAnchor, constant: 20),
                dishDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                dishPriceButton.topAnchor.constraint(equalTo: dishDescriptionLabel.bottomAnchor, constant: 10),
                dishPriceButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                dishPriceButton.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10)
            ]
        )
    }
    
}

