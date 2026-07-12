//
//  HomeView.swift
//  BaseSwiftUI
//
//  Created by Nejat Boy on 26.06.2026.
//

import SwiftUI


struct PostsView: View {

    @StateObject private var viewModel: PostsViewModel


    init(viewModel: PostsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }


    var body: some View {
        content
            .navigationTitle("Gönderiler")
            .task { await viewModel.loadPosts() }
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

        case let .loaded(posts):
            List(posts) { post in
                VStack(alignment: .leading, spacing: 4) {
                    Text(post.title)
                        .font(.headline)

                    Text(post.body)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }
                .padding(.vertical, 4)
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
        Task { await viewModel.loadPosts() }
    }
}
