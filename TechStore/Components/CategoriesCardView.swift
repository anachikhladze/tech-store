//
//  CategoriesCardView.swift
//  TechStore
//
//  Created by Anna Sumire on 18.12.23.
//

import SwiftUI

struct CategoriesCardView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    var product: Product
    
    var body: some View {
        ZStack() {
            Rectangle()
                .frame(width: 160, height: 200)
                .cornerRadius(30)
                .foregroundColor(Color(hue: 1.0, saturation: 0.087, brightness: 0.99))
                .shadow(radius: 3)
            
            VStack(alignment: .center) {
                Image("\(product.category)")
                    .resizable()
                    .cornerRadius(10)
                    .frame(width: 80, height: 80)
                    .aspectRatio(contentMode: .fit)
                
            
                Text(product.category)
                    .lineLimit(1)
                    .font(.system(size: 18, weight: .bold))
                    .bold()
            }
        }
    }
}


