//
//  MedicalStaff.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 04/09/21.
//

import Foundation

struct MedicalStaff: Codable {
    var idResponsableMedico: Int?
    let nombre: String
    let apellido1: String
    let apellido2: String?
    let idHospital: Int
    
    
    func fullName() -> String{
        return "\(nombre) \(apellido1) \(apellido2 ?? "")"
    }
}
