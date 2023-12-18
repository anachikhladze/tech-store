//
//  ProductDetailView.swift
//  TechStore
//
//  Created by Anna Sumire on 18.12.23.
//

import SwiftUI

struct ProductDetailView: View {
    
    @StateObject var viewModel = MainViewModel()
    @Binding var navigationPath: NavigationPath
    var product: Product
    
    var body: some View {
        ScrollView {
            VStack {
                InfoCardView(product: product)
                
                CustomButtonView(text: "Back to home") {
                    navigationPath = NavigationPath()
                }
                .onAppear {
                    viewModel.fetchProducts()
                }
            }
        }
    }
}
//#Preview {
//    ProductDetailView()
//}
