//
//  InformCellView.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 05/09/21.
//

import SwiftUI

struct InformCellView: View {
    let inform: Inform
    
    
    init(inform:Inform){
        self.inform = inform
    }
    
    var body: some View {
        HStack {
            VStack{
                Image(systemName:"info.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height:30)
                    .cornerRadius(15)
                    .foregroundColor(Color("Principal"))
            }
            .frame(width: 70.0, height:70.0)
            
            VStack(alignment: .leading){
                Text(inform.titulo)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .lineLimit(2)
                    .padding(/*@START_MENU_TOKEN@*/.bottom, 2.0/*@END_MENU_TOKEN@*/)

                
                if let responsableMedico = inform.responsableMedico {
                    Text("Responsable Medico: \(responsableMedico.nombre)")
                       
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                    
                }
                Text(inform.fecha,style: .date)
                
            }.padding()
            
        }
    }
}

struct InformCellView_Previews: PreviewProvider {
    static var previews: some View {
        InformCellView(inform: Inform.exampleInform())
    }
}
