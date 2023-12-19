//
//  TechStoreApp.swift
//  TechStore
//
//  Created by Anna Sumire on 17.12.23.
//

import SwiftUI

@main
struct TechStoreApp: App {
    @StateObject var viewModel = MainViewModel()

    var body: some Scene {
        WindowGroup {
            MainTabView().environmentObject(viewModel)
        }
    }
}
