//
//  AppContainer.swift
//  BaseSwiftUI
//
//  Created by Nejat Boy on 12.07.2026.
//

import Foundation


final class AppContainer {

    private let apiClient: APIClient

    init() {
        apiClient = URLSessionAPIClient(
            baseURL: URL(string: "https://jsonplaceholder.typicode.com")!
        )
    }


    @MainActor
    func makePostsView() -> PostsView {
        let repository = RemotePostRepository(apiClient: apiClient)
        return PostsView(viewModel: PostsViewModel(repository: repository))
    }
}
