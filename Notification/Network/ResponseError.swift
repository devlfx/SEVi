//
//  ResponseError.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 06/08/21.
//

import Foundation

protocol Titleable {
    var title: String { get }
}

enum ResponseError: Error, Titleable {
    case invalidResponse
    case clientError
    case serverError

    var title: String {
        switch self {
        case .invalidResponse:
            return "Invalid Response"
        case .clientError:
            return "Client error"
        case .serverError:
            return "Internal Server error"
        }
    }
}


