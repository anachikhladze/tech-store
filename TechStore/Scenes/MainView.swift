//
//  MainView.swift
//  TechStore
//
//  Created by Anna Sumire on 17.12.23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()

    private let columns = [
        GridItem(.flexible())
    ]
    
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
                                // actiion 
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
            }
        .environmentObject(viewModel)
        }
    }


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
