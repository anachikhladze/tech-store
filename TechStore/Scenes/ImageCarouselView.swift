//
//  ImageCarouselView.swift
//  TechStore
//
//  Created by Anna Sumire on 18.12.23.
//

import SwiftUI

struct ImageCarouselView: View {
    // MARK: - Properties
    @State private var selectedImageIndex = 0
    var images: [String]
    
    // MARK: - Body
    var body: some View {
        VStack {
            imageTabView
            indicatorHStack
        }
    }
    
    // MARK: - ImageTabView
    private var imageTabView: some View {
        TabView(selection: $selectedImageIndex) {
            ForEach(0..<images.count, id: \.self) { index in
                imageAtIndex(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .frame(height: 280)
        .onAppear {
            selectedImageIndex = 0
        }
    }
    
    private var indicatorHStack: some View {
        HStack {
            Spacer()
            ForEach(0..<images.count, id: \.self) { index in
                Circle()
                    .fill(index == selectedImageIndex ? Color.primary : Color.secondary)
                    .frame(width: 8, height: 8)
            }
            Spacer()
        }
    }
    
    // MARK: - Methods
    private func imageAtIndex(_ index: Int) -> some View {
        Group {
            if let url = URL(string: images[index]) {
                AsyncImage(url: url) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 400, height: 390)
                .aspectRatio(contentMode: .fit)
                .tag(index)
            } else {
                Text("Invalid URL")
                    .frame(width: 400, height: 390)
                    .background(Color.gray)
            }
        }
    }
}
    
//
//#Preview {
//    ImageCarouselComponentView(images: ["cream", "skincare", "groceries"])
//}
