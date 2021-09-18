//
//  PrecedurAuthorization.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 04/09/21.
//

import Foundation

struct ProcedurAuthorization: Codable{
    var idProcedimientoAutorizacion: Int?
    let idEstancia: Int
    let idResponsable: Int
    let fechaAutorizacion: Date
}
