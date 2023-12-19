//
//  ProductDetailView.swift
//  TechStore
//
//  Created by Anna Sumire on 18.12.23.
//

import SwiftUI

struct InfoCardView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: MainViewModel
    var product: Product
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            productImageView
            productTitleView
            productDescriptionView
            productPriceAndStockView
            productDiscountView
            productRatingView
            productBrandView
            productCategoryView
        }
        .padding()
        .background(Color(hue: 1.0, saturation: 0.087, brightness: 0.99).edgesIgnoringSafeArea(.all))
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding()
    }
    
    private var productImageView: some View {
        ImageCarouselView(images: product.images)
    }
    
    private var productTitleView: some View {
        Text(product.title)
            .font(.title)
            .foregroundColor(.blue)
    }
    
    private var productDescriptionView: some View {
        Text(product.description)
            .font(.subheadline)
            .foregroundColor(.gray)
    }
    
    private var productPriceAndStockView: some View {
        HStack {
            Text("$\(product.price)")
                .font(.headline)
                .foregroundColor(.green)
            
            Spacer()
            
            Text("Stock: \(product.id)")
                .font(.headline)
                .foregroundColor(.orange)
        }
    }
    
    private var productDiscountView: some View {
        Text("Discount: \(String(format: "%.2f%%", product.discountPercentage))")
            .font(.subheadline)
            .foregroundColor(.red)
    }
    
    private var productRatingView: some View {
        Text("Rating: \(String(format: "%.2f", product.rating))")
            .font(.subheadline)
            .foregroundColor(.purple)
    }
    
    private var productBrandView: some View {
        Text("Brand: \(product.brand)")
            .font(.subheadline)
            .foregroundColor(.secondary)
    }
    
    private var productCategoryView: some View {
        Text("Category: \(product.category)")
            .font(.subheadline)
            .foregroundColor(.secondary)
    }
}
