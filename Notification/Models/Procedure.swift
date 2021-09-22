//
//  Procedure.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 04/09/21.
//

import Foundation

struct Procedure: Codable{
    var idProcedimiento: Int?
    let nombre: String
    let costo: Decimal
    let descripcion: String
    let duracionAproximada: Decimal
}
