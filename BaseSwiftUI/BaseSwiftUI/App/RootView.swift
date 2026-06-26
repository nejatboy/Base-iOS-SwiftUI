//
//  RootView.swift
//  BaseSwiftUI
//
//  Created by Nejat Boy on 26.06.2026.
//

import SwiftUI


struct RootView: View {

    var body: some View {
        NavigationView {
            HomeView(
                viewModel: HomeViewModel(repository: PreviewItemRepository())
            )
        }
        .navigationViewStyle(.stack)
    }
}
