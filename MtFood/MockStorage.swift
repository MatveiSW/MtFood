//
//  MockStorage.swift
//  MtFood
//
//  Created by Матвей Авдеев on 15.01.2024.
//

import Foundation

struct MockStorage {
    static let shared = MockStorage()
    
    let bannerImages = ["oneBannerImage", "twoBannerImage", "threeBannerImage", "foreBannerImage"]
    
    private init() {}
}
