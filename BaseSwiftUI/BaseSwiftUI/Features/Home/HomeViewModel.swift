//
//  HomeViewModel.swift
//  BaseSwiftUI
//
//  Created by Nejat Boy on 26.06.2026.
//

import Foundation


@MainActor
final class HomeViewModel: BaseViewModel<[Item]> {

    private let repository: ItemRepository


    init(repository: ItemRepository) {
        self.repository = repository
        super.init()
    }


    func loadItems() async {
        await load(repository.fetchItems, isEmpty: \.isEmpty)
    }
}
