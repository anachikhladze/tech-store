//
//  FeaturedCardView.swift
//  TechStore
//
//  Created by Anna Sumire on 17.12.23.
//

import SwiftUI

struct FeaturedCardView: View {
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            Rectangle()
                .cornerRadius(10)
                .frame(width: 365, height: 100)
                .foregroundColor(Color(hue: 1.0, saturation: 0.087, brightness: 0.99))
                .shadow(radius: 3)
            
            HStack(alignment: .top, spacing: 4) {
                
                Image("iphone15")
                    .resizable()
                    .cornerRadius(10)
                    .frame(width: 80, height: 60)
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Iphone 15")
                        .font(.system(size: 18, weight: .bold))
                    
                    Text("iPhone 15 and iPhone 15 Plus are designed with the following features to reduce their environmental impact...")
                        .font(.system(size: 13))
                        .lineLimit(2)
                }
                
                Text("$799")
                    .font(.system(size: 18, weight: .bold))
            }
            .padding()
        }
    }
}
