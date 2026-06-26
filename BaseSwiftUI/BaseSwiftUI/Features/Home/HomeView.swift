//
//  HomeView.swift
//  BaseSwiftUI
//
//  Created by Nejat Boy on 26.06.2026.
//

import SwiftUI


struct HomeView: View {

    @StateObject private var viewModel: HomeViewModel


    init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }


    var body: some View {
        content
            .navigationTitle("Ana Sayfa")
            .task { await viewModel.loadItems() }
    }


    @ViewBuilder
    private var content: some View {
        switch viewModel.state {

        case .idle, .loading:
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)

        case .empty:
            Text("Kayıt yok")
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, maxHeight: .infinity)

        case let .loaded(items):
            List(items) { item in
                Text(item.name)
            }

        case let .failed(error):
            VStack(spacing: 16) {
                Text(error.localizedDescription)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)

                Button("Tekrar dene", action: reload)
                    .buttonStyle(.bordered)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }


    private func reload() {
        Task {
            await viewModel.loadItems()
        }
    }
}
