//
//  MainViewModel.swift
//  TechStore
//
//  Created by Anna Sumire on 18.12.23.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var balance: Int = 1500
    @Published var productData: ProductData?
    
    @Published var cartProducts: [Product] = []
    @Published var total: Int = 0
    
    @Published var showingSuccessAlert = false
    @Published var showingDeclineAlert = false
    @Published var isLoading = false
    
    
    // MARK: - Init
    init() {
        fetchProducts()
    }
    
    // MARK: - Methods
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
        cartProducts.append(product)
        total += product.price
    }
    
    func removeFromCart(product: Product) {
        cartProducts = cartProducts.filter { $0.id != product.id }
        total -= product.price
    }
    
    func startFakeCheckout() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isLoading = false
            if self.total < self.balance && self.total != 0 {
                self.showingSuccessAlert.toggle()
                self.balance -= self.total
                self.total = 0
                self.cartProducts = []
            } else if self.total > self.balance {
                self.showingDeclineAlert.toggle()
            }
        }
    }
}
