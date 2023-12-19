//
//  ProductsView.swift
//  TechStore
//
//  Created by Anna Sumire on 18.12.23.
//

import SwiftUI

struct ProductsView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: MainViewModel
    @Binding var navigationPath: NavigationPath
    var product: Product
    
    // MARK: - Body
    var body: some View {
        ZStack {
            BackgroundView()
            MainContentView(navigationPath: $navigationPath, product: product)
        }
        .environmentObject(viewModel)
    }
}

struct BackgroundView: View {
    var body: some View {
        Color(Color(hue: 1.0, saturation: 0.087, brightness: 0.99))
            .edgesIgnoringSafeArea(.all)
    }
}

struct MainContentView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @Binding var navigationPath: NavigationPath
    var product: Product
    
    var body: some View {
        VStack {
            HeaderView()
                .padding(.horizontal)
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    CategoryTitleView(product: product)
                    ProductsGridView(navigationPath: $navigationPath, product: product)
                    BestsellerTitleView()
                    FeaturedCardView()
                    CheckoutButtonsView()
                }
            }
            .padding()
        }
    }
}

struct CategoryTitleView: View {
    var product: Product
    
    var body: some View {
        Text("\(product.category) 🔥")
            .font(.system(size: 18, weight: .bold))
    }
}

struct ProductsGridView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @Binding var navigationPath: NavigationPath
    var product: Product
    
    private let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: columns, spacing: 20) {
                if let products = viewModel.productData?.products {
                    ForEach(products.filter { $0.category == product.category }, id: \.id) { product in
                        NavigationLink(destination: ProductDetailView(navigationPath: $navigationPath, product: product)) {
                            ProductCardView(product: product)
                        }
                    }
                }
            }
        }
        .frame(height: 340)
        .onAppear {
            viewModel.fetchProducts()
        }
    }
}

struct BestsellerTitleView: View {
    var body: some View {
        Text("Week Bestseller 🤩")
            .font(.system(size: 24, weight: .bold))
    }
}

struct CheckoutButtonsView: View {
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            CustomButtonView(text: "Checkout") {
                viewModel.startFakeCheckout()
            }
            .alert("Payment Info", isPresented: $viewModel.showingSuccessAlert) {
                // Default "Ok" button
            } message: {
                if viewModel.total < viewModel.balance {
                    Text("✅ You've successfully purchased the products! ")
                }
            }
            .alert("Payment Info", isPresented: $viewModel.showingDeclineAlert) {
                // Default "Ok" button
            } message: {
                if viewModel.total > viewModel.balance {
                    Text("🚫 Your payment was declined. ")
                }
            }
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(3)
            }
            
            CustomButtonView(text: "Clear Cart") {
                viewModel.cartProducts = []
                viewModel.total = 0
            }
            Spacer()
        }
    }
}

