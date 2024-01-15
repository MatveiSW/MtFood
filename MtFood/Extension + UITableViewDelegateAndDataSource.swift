//
//  Extension + UITableViewDelegateAndDataSource.swift
//  MtFood
//
//  Created by Матвей Авдеев on 15.01.2024.
//

import UIKit

extension FoodListViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredDishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: dishListIdentifier, for: indexPath) as? DishListTableViewCell else { return UITableViewCell() }
        
        cell.configure(dish: filteredDishes[indexPath.row])
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        view.frame.height / 4.2
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
}
