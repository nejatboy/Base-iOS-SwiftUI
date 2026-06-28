//
//  Endpoint.swift
//  BaseSwiftUI
//
//  Created by Nejat Boy on 28.06.2026.
//

import Foundation


struct Endpoint {

    let path: String
    let method: HTTPMethod
    let queryItems: [URLQueryItem]
    let body: Data?


    init(path: String, method: HTTPMethod = .get, queryItems: [URLQueryItem] = [], body: Data? = nil) {
        self.path = path
        self.method = method
        self.queryItems = queryItems
        self.body = body
    }
}


enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
