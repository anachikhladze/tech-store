//
//  HeaderView.swift
//  TechStore
//
//  Created by Anna Sumire on 17.12.23.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Balance: $\(viewModel.balance)")
                Text("Cart Total: $\(viewModel.total)")
            }
            .font(.headline)
            
            Spacer()
            
            CartButtonView(numberOfProducts: viewModel.cartProducts.count)
                .environmentObject(viewModel)
        }
    }
}

//#Preview {
//    HeaderView()
//}
