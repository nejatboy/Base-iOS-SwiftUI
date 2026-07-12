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
            PostsView(viewModel: PostsViewModel(repository: makeRepository()))
        }
        .navigationViewStyle(.stack)
    }


    private func makeRepository() -> PostRepository {
        let apiClient = URLSessionAPIClient(baseURL: URL(string: "https://jsonplaceholder.typicode.com")!)
        return RemotePostRepository(apiClient: apiClient)
    }
}
