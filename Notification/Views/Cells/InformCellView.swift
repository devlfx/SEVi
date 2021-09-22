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
        
        ZStack{
            
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
                
                Spacer(minLength: 2)
                
                VStack(alignment: .leading){
                    Text(inform.titulo)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color("PrincipalL"))
                        .lineLimit(2)
                        .padding(/*@START_MENU_TOKEN@*/.bottom, 2.0/*@END_MENU_TOKEN@*/)
                        
                    
                    
                    if let responsableMedico = inform.responsableMedico {
                        Text("Responsable Medico: \(responsableMedico.nombre)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                    }
                    Text(inform.fecha,style: .date)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                }
                Spacer()
            }.padding() .background(
                RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                    .fill(Color.offWhite)
                    //                .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            )
        }
    
    }
}

struct InformCellView_Previews: PreviewProvider {
    static var previews: some View {
        InformCellView(inform: Inform.exampleInform())
    }
}
