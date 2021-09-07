//
//  Patient.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 30/08/21.
//

import Foundation


struct Patient: Codable {
    var idPaciente:Int?
    let identificador: String
    let nombre: String
    let apellido1:String
    let apellido2:String?
    
    
    func fullName() -> String{
        return "\(nombre) \(apellido1) \(apellido2 ?? "")"
    }
}
