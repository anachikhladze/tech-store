//
//  CategoriesView.swift
//  TechStore
//
//  Created by Anna Sumire on 18.12.23.
//

import SwiftUI

struct CategoriesView: View {
    
    // MARK: - Properties
    @StateObject var viewModel = MainViewModel()
    @State private var navigationPath = NavigationPath()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - Body
    var body: some View {
        NavigationStack(path: $navigationPath) {
            categoriesScrollView
                .navigationBarTitle("Categories", displayMode: .inline)
                .background(Color(hue: 1.0, saturation: 0.087, brightness: 0.99).edgesIgnoringSafeArea(.all))
                .navigationDestination(for: Product.self) { product in
                    ProductsView(navigationPath: $navigationPath, product: product)
                }
        }
    }
    
   private var categoriesScrollView: some View {
        ScrollView() {
            LazyVGrid(columns: columns, spacing: 10) {
                categoriesCardViews
            }
            .scrollIndicators(ScrollIndicatorVisibility.never)
        }
    }
    
    private var categoriesCardViews: some View {
        Group {
            if let products = viewModel.productData?.products {
                productViews(for: products)
            } else {
                Text("No products available")
            }
        }
    }
    
    @ViewBuilder
    private func productViews(for products: [Product]) -> some View {
        ForEach(products.indices) { index in
            if index == 0 || (index - 5) % 6 == 0   {
                productCard(for: products[index])
            }
        }
    }
    
    @ViewBuilder
    private func productCard(for product: Product) -> some View {
        NavigationLink(value: product) {
            CategoriesCardView(product: product)
                .environmentObject(viewModel)
                .padding(.bottom, 15)
        }
    }
}


#Preview {
    CategoriesView()
}
