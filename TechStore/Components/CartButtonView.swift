//
//  CartButtonView.swift
//  TechStore
//
//  Created by Anna Sumire on 17.12.23.
//

import SwiftUI

struct CartButtonView: View {
    
    // MARK: - Properties
    var numberOfProducts: Int
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart")
                .padding(.top, 5)
                .foregroundColor(.black)
                .frame(width: 40, height: 40)
            
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.caption2)
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(Color(hue: 1.0, saturation: 0.915, brightness: 0.791))
                    .cornerRadius(50)
            }
        }
    }
}

#Preview {
    CartButtonView(numberOfProducts: 1)
}
