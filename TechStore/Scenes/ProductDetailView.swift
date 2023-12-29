//
//  ProductDetailView.swift
//  TechStore
//
//  Created by Anna Sumire on 18.12.23.
//

import SwiftUI

struct ProductDetailView: View {
    
    // MARK: - Properties
    @StateObject var viewModel = MainViewModel()
    @Binding var navigationPath: NavigationPath
    var product: Product
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack {
                InfoCardView(product: product)
                
                CustomButtonView(text: "Back to categories") {
                    navigationPath.removeLast(navigationPath.count)
                }
                .onAppear {
                    viewModel.fetchProducts()
                }
            }
        }
        .background(Color(hue: 1.0, saturation: 0.087, brightness: 0.99).edgesIgnoringSafeArea(.all))
    }
}

//#Preview {
//    ProductDetailView()
//}
