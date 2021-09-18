//
//  ProcedureCellView.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 11/09/21.
//

import SwiftUI

struct ProcedureCellView: View {
    
    
    let procedureInform: ProcedureInform
    
    init(procedureInform: ProcedureInform){
        self.procedureInform = procedureInform
    }
    
    
    var body: some View {
        HStack{
            VStack{
                Text(procedureInform.procedimiento.nombre)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text("Duracion Aproximada en horas: \(procedureInform.procedimiento.duracionAproximada.description)")
                    .font(.subheadline)

            }
            Spacer(minLength: 5)
            if let authorizations = procedureInform.procedimientoAutorizacion, authorizations.count > 0{
                Image(systemName:"checkmark.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height:30)
                    .foregroundColor(Color("Third"))
                
            } else {
                Image(systemName:"exclamationmark.triangle")
                    .resizable()
                    .scaledToFit()
                    .frame(height:30)
                    .foregroundColor(Color("Secondary"))
            }
            
        }
    }
}

struct ProcedureCellView_Previews: PreviewProvider {
    static var previews: some View {
//        ProcedureCellView()
        HStack{
            
        }
    }
}
