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
            VStack(alignment: .leading, spacing: 15){
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
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .fill(Color.offWhite)
                //                .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
        )
    }
}

struct ProcedureCellView_Previews: PreviewProvider {
    static var previews: some View {
//        ProcedureCellView()
        HStack{
            
        }
    }
}
