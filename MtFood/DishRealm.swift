//
//  DishRealm.swift
//  MtFood
//
//  Created by Матвей Авдеев on 15.01.2024.
//

import Foundation
import RealmSwift

class DishesRealm: Object {
    @Persisted var dishes = List<DishRealm>()
}

class DishRealm: Object {
    @Persisted var name = ""
    @Persisted var price = 0
    @Persisted var descriptionDish = ""
    @Persisted var imageUrl = ""
    @Persisted var tegs = List<String>()
}
