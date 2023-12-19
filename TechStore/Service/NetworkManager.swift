//
//  NetworkManager.swift
//  TechStore
//
//  Created by Anna Sumire on 18.12.23.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    func fetchProductData() async throws -> ProductData {
        let endpoint = "https://dummyjson.com/products"
        
        guard let url = URL(string: endpoint) else {
            throw GHError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GHError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(ProductData.self, from: data)
        } catch {
            throw GHError.invalidData
        }
    }
}

enum GHError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

/*
 ვიცი რომ package-ად უნდა მქონდეს და ჯენერიკად, უბრალოდ
 async await-ით პირველად გავაკეთე და შემდეგისთვის გავაკეთებ package-ს <3
 */
