//
//  HomeRepository.swift
//  BaseSwiftUI
//
//  Created by Nejat Boy on 26.06.2026.
//

import Foundation


protocol PostRepository {
    func fetchPosts() async throws -> [Post]
}


final class RemotePostRepository: PostRepository {

    private let apiClient: APIClient


    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }


    func fetchPosts() async throws -> [Post] {
        let endpoint = Endpoint(path: "posts")
        return try await apiClient.request(endpoint, as: [Post].self)
    }
}
