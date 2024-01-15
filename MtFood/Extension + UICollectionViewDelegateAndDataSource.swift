//
//  Extension + UICollectionViewDelegateAndDataSource.swift
//  MtFood
//
//  Created by Матвей Авдеев on 15.01.2024.
//

import UIKit

extension FoodListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionView == bannerCollectionView ? mockStorage.bannerImages.count : uniqueTegs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == bannerCollectionView {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bannerIdentifier, for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell() }
            
            cell.bannerImage.image = UIImage(named: mockStorage.bannerImages[indexPath.row])
            
            return cell
            
        } else if collectionView == dishCategoriesCollectionView {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoriesIdentifier, for: indexPath) as? DishCategoriesCollectionViewCell else { return UICollectionViewCell() }
            
            cell.configure(teg: uniqueTegs[indexPath.row])
            cell.isSelectedCell = uniqueTegs[indexPath.row] == selectedTeg
            
            return cell
        }
        
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        if collectionView == dishCategoriesCollectionView {
            
            selectedTeg = uniqueTegs[indexPath.row]
            
            filteredDishes = selectedTeg == "Все меню" ? dishList?.dishes ?? [] : dishList?.dishes.filter { $0.tegs.contains(selectedTeg) } ?? []
            
            collectionView.reloadData()
            dishListTableView.reloadData()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width - 80
        let height = collectionView.frame.height - 40
        
        return CGSize(width: width, height: height)
    }
    
    
}
