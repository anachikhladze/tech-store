//
//  ProductCardView.swift
//  TechStore
//
//  Created by Anna Sumire on 17.12.23.
//

import SwiftUI

struct ProductCardView: View {
    @EnvironmentObject var viewModel: MainViewModel
    var product: Product
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ZStack() {
                Rectangle()
                    .frame(width: 260, height: 320)
                    .cornerRadius(30)
                    .foregroundColor(Color(hue: 1.0, saturation: 0.087, brightness: 0.99))
                    .shadow(radius: 3)
                
                VStack(alignment: .leading) {
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
            }
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
}
