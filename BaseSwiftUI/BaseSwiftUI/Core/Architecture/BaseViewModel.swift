//
//  BaseViewModel.swift
//  BaseSwiftUI
//
//  Created by Nejat Boy on 26.06.2026.
//

import Foundation


@MainActor
class BaseViewModel<T>: ObservableObject {

    @Published private(set) var state: ViewState<T> = .idle


    func load(
        _ operation: () async throws -> T,
        isEmpty: (T) -> Bool = { _ in false }
    ) async {
        state = .loading

        do {
            let value = try await operation()
            state = isEmpty(value) ? .empty : .loaded(value)

        } catch {
            state = .failed(error)
        }
    }


    func setState(_ newState: ViewState<T>) {
        state = newState
    }
}
