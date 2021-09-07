//
//  CurrentUser.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 29/08/21.
//

import Foundation


struct CurrentUser {
    
    var responsable:Responsable?
    public static var shared = CurrentUser()
    
    
    var password: String? {
        get {
            try? KeychainStore.common.getItem(forKey: "notification.password")
        }
    }
    
    var username: String? {
        get {
            try? KeychainStore.common.getItem(forKey: "notification.username")
        }
    }
    
    public func setCredential(credentials:Credentials){
        setUsername(username: credentials.email)
        setPassword(password: credentials.password)
    }
    
    public func setUsername(username:String){
        _ = KeychainStore.common.setItem(key: "notification.username", value: username)
    }
    
    public func setPassword(password:String){
        _ = KeychainStore.common.setItem(key: "notification.password", value: password)
    }
    

    
    private init () {
    }
    
    
}
