//
//  NetworkManager.swift
//  MtFood
//
//  Created by Матвей Авдеев on 15.01.2024.
//

import UIKit
import Kingfisher

enum Link {
    case dish
    
    var url: URL {
        switch self {
        case .dish:
            return URL(string: "https://run.mocky.io/v3/40cb72ab-cca2-403c-a0e5-a4863d74b038")!
        }
    }
}

enum NetworkError: Error {
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetch<T: Decodable>(_ type: T.Type, withUrl url: URL, completion: @escaping(Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                completion(.failure(.noData))
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let networkData = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(networkData))
                }
            } catch {
                print(error.localizedDescription)
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
    
    func fetchImage(withUrl url: URL, andImage image: UIImageView) {
        image.kf.setImage(with: url)
    }
    
    private init() {}
}
