//
//  Dish.swift
//  MtFood
//
//  Created by Матвей Авдеев on 15.01.2024.
//

import Foundation

struct Dishes: Decodable {
    let dishes: [Dish]
}

struct Dish: Decodable {
    let name: String
    let price: Int
    let description: String
    let imageUrl: String
    let tegs: [String]
}
