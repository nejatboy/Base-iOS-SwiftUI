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


final class PreviewPostRepository: PostRepository {
    func fetchPosts() async throws -> [Post] {
        [
            Post(userId: 1, id: 1, title: "Birinci başlık", body: "Birinci içerik"),
            Post(userId: 1, id: 2, title: "İkinci başlık", body: "İkinci içerik"),
        ]
    }
}
