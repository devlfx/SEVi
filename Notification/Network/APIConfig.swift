//
//  APIConfig.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 24/08/21.
//

import Foundation


struct APIConfig{
    static let shared = APIConfig()
    
    private init(){}
    
    
    var host: String {
        return "https://salaesperavirtual.herokuapp.com"
    }
    
    
    var apiToken: String? {
        get {
            try? KeychainStore.common.getItem(forKey: "notification.apitoken")
        }
    }

    func setApiToken(_ value: String) {
        print(value)
        _ = KeychainStore.common.setItem(key: "notification.apitoken", value: value)
    }
    
}
