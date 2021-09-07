//
//  ProcedureInform.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 04/09/21.
//

import Foundation

struct ProcedureInform:Codable {
    var idProcecimientoInforme: Int?
    let idProcedimiento: Int
    let idInforme:Int
    let procedimiento: Procedure
    let procedimientoAutorizacion:[PrecedurAuthorization]?
}


