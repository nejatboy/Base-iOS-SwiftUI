//
//  RootView.swift
//  BaseSwiftUI
//
//  Created by Nejat Boy on 26.06.2026.
//

import SwiftUI


struct RootView: View {

    let container: AppContainer

    var body: some View {
        NavigationStack {
            container.makePostsView()
        }
    }
}
