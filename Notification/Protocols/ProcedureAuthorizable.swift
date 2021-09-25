//
//  ProcedureAuthorizable.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 25/09/21.
//

import Foundation
/**
 Protocol to ensure the object has the necesary function to authorize a procedure
 */
protocol ProcedureAuthorizable{
    func authorizeProcedure(withIdentificator id: Int, completion: ( () -> Void )? )
}
