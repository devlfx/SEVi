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
        HStack {
            Image(systemName:"person.fill")
                .resizable()
                .scaledToFit()
                .frame(height:70)
                .cornerRadius(15)
                .foregroundColor(Color("Third"))
            
            VStack(alignment: .leading, spacing: 5){
                Text(stay.paciente.fullName())
                    .fontWeight(.semibold)
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
            
        }
    }
    
    init(stay:Stay){
        self.stay = stay
    }
    
}

struct StayCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        StayCellView(stay: Stay.exampleStay())
    }
}
