//
//  APIError.swift
//  BaseSwiftUI
//
//  Created by Nejat Boy on 28.06.2026.
//

import Foundation


enum APIError: Error, LocalizedError {

    case invalidURL
    case requestFailed(statusCode: Int)
    case decodingFailed(Error)
    case transport(Error)
    case unknown


    var errorDescription: String? {
        switch self {

        case .invalidURL:
            return "Geçersiz adres."

        case let .requestFailed(statusCode):
            return "İstek başarısız oldu (\(statusCode))."

        case .decodingFailed:
            return "Sunucu yanıtı çözümlenemedi."

        case .transport:
            return "Bağlantı hatası. İnternet bağlantını kontrol et."

        case .unknown:
            return "Bilinmeyen bir hata oluştu."
        }
    }
}
