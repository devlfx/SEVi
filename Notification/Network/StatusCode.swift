//
//  StatusCode.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 06/08/21.
//

import Foundation

enum StatusCode: Int {
    case unkown = 0
    case info
    case success
    case redirection
    case clientError
    case serverError
    case unauthorized
    case notFound

    public init(rawValue: Int) {
        switch rawValue {
        case 100, 101, 102:
            self = .info
        case 200, 201, 202, 203, 204, 205, 206, 207, 208, 226:
            self = .success
        case 300, 301, 302, 303, 304, 305, 306, 307, 308:
            self = .redirection
        case 401:
            self = .unauthorized
        case 404:
            self = .notFound
        case 400, 402, 403, 405, 406, 407, 408, 409, 410, 411, 412,
             413, 414, 415, 416, 417, 418, 421, 422, 423, 424, 426, 428, 429, 431, 451:
            self = .clientError
        case 500, 501, 502, 503, 504, 505, 506, 507, 510, 511:
            self = .serverError
        default:
            self = .unkown
        }
    }
    
    static func getError(code:Int) -> Error {
        let code = StatusCode(rawValue:code)
        switch code {
        case .unauthorized:
            return RequestError.unauthorized(code: code.rawValue, error: "El token no es valido o no se envió")
        case .serverError:
            return RequestError.serverError(code: code.rawValue, error: "Ocurrio un error en el servidor")
        case .unkown:
            return RequestError.unknown(code: code.rawValue, error: "Ocurrio un error desconocido")
        case .notFound:
            return RequestError.notFound(code: code.rawValue, error: "No se encontro el elmento solicitado")
        case .clientError:
            return RequestError.badRequest(code: code.rawValue, error: "Hubo un problema con la petición")
        default:
            return RequestError.noResponse("No hubo respuestta")
        }
        
    }
    
    func isError() -> Bool{
        switch self {
        case .unauthorized:
            return true
        case .serverError:
            return true
        case .unkown:
            return true
        case .notFound:
            return true
        case .clientError:
            return true
        default:
            return false
        }
    }
}
