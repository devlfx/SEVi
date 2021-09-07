//
//  KeychainError.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 25/08/21.
//

import Foundation

enum KeychainError: Error {
    case noItem
    case unexpectedItemData
    case unhandledError(status: OSStatus)
}
