//
//  MainTabView.swift
//  TechStore
//
//  Created by Anna Sumire on 18.12.23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            CategoriesView()
                .tabItem {
                    Image(systemName: "tray.2")
                    Text("Categories")
                }
            
//            ProductsView()
//                .tabItem {
//                    Image(systemName: "cat")
//                    Text("Products")
//                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

