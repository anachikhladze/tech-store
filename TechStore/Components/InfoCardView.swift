//
//  ProductDetailView.swift
//  TechStore
//
//  Created by Anna Sumire on 18.12.23.
//

import SwiftUI

struct InfoCardView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ImageCarouselView(images: product.images)
            
            Text(product.title)
                .font(.title)
                .foregroundColor(.blue)
            
            Text(product.description)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack {
                Text("$\(product.price)")
                    .font(.headline)
                    .foregroundColor(.green)
                
                Spacer()
                
                Text("Stock: \(product.id)")
                    .font(.headline)
                    .foregroundColor(.orange)
            }
            
            Text("Discount: \(String(format: "%.2f%%", product.discountPercentage))")
                .font(.subheadline)
                .foregroundColor(.red)
            
            Text("Rating: \(String(format: "%.2f", product.rating))")
                .font(.subheadline)
                .foregroundColor(.purple)
            
            Text("Brand: \(product.brand)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text("Category: \(product.category)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(hue: 1.0, saturation: 0.087, brightness: 0.99).edgesIgnoringSafeArea(.all))
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding()
    }
}
