//
//  ProductModel.swift
//  TechStore
//
//  Created by Anna Sumire on 18.12.23.
//

import Foundation

struct ProductData: Decodable {
    let products: [Product]
}

struct Product: Decodable, Identifiable, Hashable {
    let id: Int
    let title: String
    let description: String
    let price: Int
    let category: String
    let thumbnail: String
    let images: [String]
    let rating: Double
    let stock: Int
    let discountPercentage: Double
    let brand: String
}
