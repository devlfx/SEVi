//
//  Stay.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 30/08/21.
//

import Foundation

struct Stay:  Codable{
    var idEstancia: Int?
    let fechaIngreso:Date?
    let idPaciente: Int
    let idHospital:Int
    let identificador:String
    let paciente : Patient
    let hospital: Hospital
    var informes: [Inform]?




    public static func exampleStay()->Stay{
        let hospital = Hospital(idHospital: 1, nombre: "Lorem ipsum", direccion: "Sed ut perspiciatis unde omnis iste natus", telefono: "5539244851")
        let patient = Patient(idPaciente: 1, identificador: "OEGL960316HDFRNS04", nombre: "Luis", apellido1: "O", apellido2: "G")
        let stay = Stay(idEstancia: 1, fechaIngreso: Date(), idPaciente: 1, idHospital: 1, identificador: "q39202rad",paciente: patient, hospital: hospital)
        return stay
    }

}
