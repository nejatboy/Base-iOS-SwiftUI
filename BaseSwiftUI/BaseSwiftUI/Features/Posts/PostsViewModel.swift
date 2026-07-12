//
//  HomeViewModel.swift
//  BaseSwiftUI
//
//  Created by Nejat Boy on 26.06.2026.
//

import Foundation


@MainActor
final class PostsViewModel: BaseViewModel<[Post]> {

    private let repository: PostRepository


    init(repository: PostRepository) {
        self.repository = repository
        super.init()
    }


    func loadPosts() async {
        await load(repository.fetchPosts, isEmpty: \.isEmpty)
    }
}
