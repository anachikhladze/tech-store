//
//  ProductCardView.swift
//  TechStore
//
//  Created by Anna Sumire on 17.12.23.
//

import SwiftUI

struct ProductCardView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: MainViewModel
    var product: Product

    // MARK: - Body
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            productCard
            addToCartButton
        }
    }

    private var productCard: some View {
        ZStack() {
            cardBackground
            VStack(alignment: .leading) {
                productImage
                productDetails
            }
        }
    }

    private var cardBackground: some View {
        Rectangle()
            .frame(width: 260, height: 320)
            .cornerRadius(30)
            .foregroundColor(Color(hue: 1.0, saturation: 0.087, brightness: 0.99))
            .shadow(radius: 3)
    }

    private var productImage: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: product.thumbnail)) { image in
                image
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 240, height: 180)
            } placeholder: {
                Rectangle()
                    .foregroundColor(.secondary)
            }
            .frame(width: 240, height: 180)

            newTag
        }
    }

    private var newTag: some View {
        ZStack {
            Rectangle()
                .cornerRadius(20)
                .frame(width: 50, height: 20)
                .padding()
                .foregroundColor(Color(hue: 1.0, saturation: 0.776, brightness: 1.0))

            Text("NEW")
                .foregroundColor(.white)
                .font(.footnote)
                .bold()
        }
    }

    private var productDetails: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(product.title)
                .lineLimit(1)
                .font(.system(size: 18, weight: .bold))
                .bold()

            Text(product.category)
                .foregroundColor(.secondary)

            Text("$\(product.price)")
        }
    }

    private var addToCartButton: some View {
        Button {
            viewModel.addToCart(product: product)
        } label: {
            Image(systemName: "plus")
                .padding(10)
                .foregroundColor(.white)
                .background(.black)
                .cornerRadius(50)
                .padding()
        }
    }
}
