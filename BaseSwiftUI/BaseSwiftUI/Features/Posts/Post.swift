//
//  HomeModel.swift
//  BaseSwiftUI
//
//  Created by Nejat Boy on 26.06.2026.
//

import Foundation


struct Post: Identifiable, Decodable, Equatable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
