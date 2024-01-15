//
//  DataManager.swift
//  MtFood
//
//  Created by Матвей Авдеев on 15.01.2024.
//

import Foundation
import RealmSwift

class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    let realm = try! Realm()
    
    // MARK: CRUD methods
    
    func save(dishesRealm: DishesRealm) {
        do {
            try realm.write {
                realm.add(dishesRealm)
            }
        } catch {
            print("Error saving car: \(error)")
        }
    }
    
}
