//
//  InformDetailView.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 07/09/21.
//

import SwiftUI

struct InformDetailView: View {
    
    let inform: Inform
    
    init(inform:Inform) {
        self.inform = inform
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(inform.titulo)
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .lineLimit(1)
                    .padding(/*@START_MENU_TOKEN@*/.bottom, 2.0/*@END_MENU_TOKEN@*/)

                Spacer()
                Text(inform.fecha,style: .date)
                    .font(.title2)
                    .multilineTextAlignment(.trailing)
            }.padding()
            
            
            
            if let responsableMedico = inform.responsableMedico {
                Text("Responsable Medico: \(responsableMedico.fullName())")
                    .font(.headline)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                    .padding(.bottom)
                
            }
            
            
            Text("Descripción")
                .font(.title3)
            Text(inform.descripcion)
                .font(.body)
                .multilineTextAlignment(.leading)
            
            List{
                ForEach(inform.p, content: <#T##(_.Element) -> _#>)
            }
            
        }.padding()
    }
}

struct InformDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InformDetailView(inform: Inform.exampleInform())
    }
}
