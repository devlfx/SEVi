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
    let justificacion:String
    let procedimiento: Procedure
    let procedimientoAutorizacion:[ProcedurAuthorization]?
    
    
    
    
    
    static func example()-> ProcedureInform{
       return  ProcedureInform(idProcecimientoInforme: nil
                        , idProcedimiento: 1
                        , idInforme: 103
                        , justificacion: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
                        , procedimiento: Procedure(idProcedimiento: nil
                                                   , nombre: "Proc1"
                                                   , costo: 100.05
                                                   , descripcion: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
                                                   , duracionAproximada: 2.0)
                        , procedimientoAutorizacion: nil)
    }
}


