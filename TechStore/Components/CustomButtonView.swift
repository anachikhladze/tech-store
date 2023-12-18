//
//  CustomButtonView.swift
//  TechStore
//
//  Created by Anna Sumire on 17.12.23.
//

import SwiftUI

struct CustomButtonView: View {
    
    // MARK: - Properties
    let text: String
    let action: () -> Void
    
    // MARK: - Body
    var body: some View {
        Button(action: action, label: {
          
                Text(text)
                    .frame(height: 10)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.pink.opacity(0.6))
                .cornerRadius(10)
                
            })
        }
}
#Preview {
    CustomButtonView(text: "Test") {
        // action
    }
}
