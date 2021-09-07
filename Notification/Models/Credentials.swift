//
//  Credentials.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 24/08/21.
//

import Foundation


struct Credentials:Codable{
    var email: String
    var password:String

    init(email:String,password:String){
        self.email = email
        self.password = password
    }
}
