//
//  MainViewModel.swift
//  TechStore
//
//  Created by Anna Sumire on 18.12.23.
//

import Foundation

final class MainViewModel: ObservableObject {
    var balance: Int = 1500
    @Published var productData: ProductData?
    
    @Published var cartProducts: [Product] = []
    @Published var total: Int = 0
    
    init() {
        fetchProducts()
    }
    
    func fetchProducts() {
        Task {
            do {
                let fetchedProductData = try await NetworkManager.shared.fetchProductData()
                DispatchQueue.main.async {
                    self.productData = fetchedProductData
                }
            } catch {
                print("Error fetching products: \(error.localizedDescription)")
            }
        }
    }
    
    func addToCart(product: Product) {
        DispatchQueue.main.async { [self] in
            cartProducts.append(product)
            total += product.price
        }
    }
    
    func removeFromCart(product: Product) {
        DispatchQueue.main.async { [self] in
            cartProducts = cartProducts.filter { $0.id != product.id }
            total -= product.price
        }
    }
}


