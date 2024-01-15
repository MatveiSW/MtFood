//
//  Extension + FoodListViewControllerSetupConstraints.swift
//  MtFood
//
//  Created by Матвей Авдеев on 15.01.2024.
//

import UIKit

extension FoodListViewController {
    func setupConstraints() {
        
        NSLayoutConstraint.activate(
            [
                bannerCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                bannerCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                bannerCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                bannerCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                dishCategoriesCollectionView.topAnchor.constraint(equalTo: bannerCollectionView.bottomAnchor),
                dishCategoriesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                dishCategoriesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                dishCategoriesCollectionView.heightAnchor.constraint(equalToConstant: 70),
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                dishListTableView.topAnchor.constraint(equalTo: dishCategoriesCollectionView.bottomAnchor, constant: 20),
                dishListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                dishListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                dishListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ]
        )
    }

}
