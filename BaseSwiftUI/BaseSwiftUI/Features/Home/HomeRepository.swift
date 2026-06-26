//
//  HomeRepository.swift
//  BaseSwiftUI
//
//  Created by Nejat Boy on 26.06.2026.
//

import Foundation


protocol ItemRepository {
    func fetchItems() async throws -> [Item]
}


final class PreviewItemRepository: ItemRepository {
    func fetchItems() async throws -> [Item] {
        [
            Item(id: 1, name: "Birinci"),
            Item(id: 2, name: "İkinci")
        ]
    }
}
