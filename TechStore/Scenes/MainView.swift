//
//  MainView.swift
//  TechStore
//
//  Created by Anna Sumire on 17.12.23.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: MainViewModel
    private let columns = [
        GridItem(.flexible())
    ]
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color(Color(hue: 1.0, saturation: 0.087, brightness: 0.99))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HeaderView()
                    .padding()
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Popular Products 🔥")
                            .font(.system(size: 24, weight: .bold))
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: columns, spacing: 20) {
                                if let products = viewModel.productData?.products {
                                    ForEach(products, id: \.id) { product in
                                        ProductCardView(product: product)
                                            .environmentObject(viewModel)
                                    }
                                }
                            }
                        }
                        .frame(height: 340)
                        .onAppear {
                            viewModel.fetchProducts()
                        }
                        Text("Week Bestseller 🤩")
                            .font(.system(size: 24, weight: .bold))
                        
                        FeaturedCardView()
                        
                        HStack(alignment: .center) {
                            Spacer()
                            CustomButtonView(text: "Checkout") {
                                viewModel.startFakeCheckout()
                            }
                            
                            CustomButtonView(text: "Clear Cart") {
                                viewModel.cartProducts = []
                                viewModel.total = 0
                            }
                            Spacer()
                        }
                    }
                    .padding()
                }
            }
            
            .alert("Payment Info", isPresented: $viewModel.showingSuccessAlert) {
                // Default "Ok" button
            } message: {
                if viewModel.total < viewModel.balance {
                    Text("✅ You've successfully purchased the products!")
                }
            }
            
            .alert("Payment Info", isPresented: $viewModel.showingDeclineAlert) {
                // Default "Ok" button
            } message: {
                if viewModel.total > viewModel.balance {
                    Text("🚫 Your payment was declined.")
                }
            }
            
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(3)
            }
        }
        .environmentObject(viewModel)
    }
}



//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
