//
//  Encodable.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 17/08/21.
//

import Foundation


extension Encodable {
    func encode() -> Data? {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            return nil
        }
    }
    
    func encode(with encoder:JSONEncoder) -> Data? {
        do {
            return try encoder.encode(self)
        } catch {
            return nil
        }
    }
    
}
