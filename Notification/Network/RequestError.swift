//
//  RequestError.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 06/08/21.
//

import Foundation

enum RequestError: Error, Equatable {
    case badURL(_ error: String)
    case unauthorized(code: Int, error: String)
    case badRequest(code: Int, error: String)
    case serverError(code: Int, error: String)
    case noResponse(_ error: String)
    case unableToParseData(_ error: String)
    case unknown(code: Int, error: String)
    case notFound(code: Int, error: String)
}
