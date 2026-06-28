//
//  APIClient.swift
//  BaseSwiftUI
//
//  Created by Nejat Boy on 28.06.2026.
//

import Foundation


protocol APIClient {
    func request<T: Decodable>(_ endpoint: Endpoint,as type: T.Type) async throws -> T
}


final class URLSessionAPIClient: APIClient {

    private let baseURL: URL
    private let session: URLSession
    private let decoder: JSONDecoder


    init(
        baseURL: URL,
        session: URLSession = .shared,
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.baseURL = baseURL
        self.session = session
        self.decoder = decoder
    }


    func request<T: Decodable>(_ endpoint: Endpoint,as type: T.Type) async throws -> T {
        let request = try makeRequest(from: endpoint)
        let data: Data
        let response: URLResponse

        do {
            (data, response) = try await session.data(for: request)

        } catch {
            throw APIError.transport(error)
        }

        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.unknown
        }

        guard 200 ..< 300 ~= httpResponse.statusCode else {
            throw APIError.requestFailed(statusCode: httpResponse.statusCode)
        }

        do {
            return try decoder.decode(T.self, from: data)

        } catch {
            throw APIError.decodingFailed(error)
        }
    }


    private func makeRequest(from endpoint: Endpoint) throws -> URLRequest {
        var components = URLComponents(
            url: baseURL.appendingPathComponent(endpoint.path),
            resolvingAgainstBaseURL: false
        )

        if !endpoint.queryItems.isEmpty {
            components?.queryItems = endpoint.queryItems
        }

        guard let url = components?.url else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.httpBody = endpoint.body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
}
