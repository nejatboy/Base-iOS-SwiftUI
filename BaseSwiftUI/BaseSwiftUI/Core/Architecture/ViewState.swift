//
//  ViewState.swift
//  BaseSwiftUI
//
//  Created by Nejat Boy on 26.06.2026.
//

import Foundation


enum ViewState<T> {
    case idle
    case loading
    case empty
    case loaded(T)
    case failed(Error)
}
