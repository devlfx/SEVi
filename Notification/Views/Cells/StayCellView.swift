//
//  StayCellView.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 03/09/21.
//

import SwiftUI

struct StayCellView: View {
    var stay : Stay
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .fill(Color.offWhite)
//                .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
      
                
            HStack {
                Image("p1")
                    .resizable()
                    .scaledToFit()
                    .frame(height:70)
                    .clipShape(Circle())
                
                Spacer(minLength: 2)
                
                VStack(alignment: .leading, spacing: 5){
                    Text(stay.paciente.fullName())
                        .fontWeight(.semibold)
                        .foregroundColor(Color("PrincipalL"))
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        .minimumScaleFactor(0.5)
                    
                    
                    if let fecha = stay.fechaIngreso{
                        Text(fecha,style: .date)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Text(stay.hospital.nombre)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }.padding()
        }
        
        
        
    }
    
    init(stay:Stay){
        self.stay = stay
    }
    
}

struct StayCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        StayCellView(stay: Stay.example())
    }
}
