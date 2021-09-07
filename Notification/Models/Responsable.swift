//
//  Responsable.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 29/08/21.
//

import Foundation

struct Responsable : Codable{
    
    var idResponsable: Int?
    let nombre: String
    let apellido1:  String
    let apellido2: String?
    let email:String
    let identificador:String
    
    func fullName() -> String{
        return "\(nombre) \(apellido1) \(apellido2 ?? "")"
    }
}
//{
//  "token": "string",
//  "user": {
//    "id_responsable": 0,
//    "nombre": "string",
//    "apellido_1": "string",
//    "apellido_2": "string",
//    "email": "user@example.com",
//    "identificador": "string"
//  }
//}
