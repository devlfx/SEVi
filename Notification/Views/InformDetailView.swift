//
//  InformDetailView.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 07/09/21.
//

import SwiftUI

struct InformDetailView: View {
    @EnvironmentObject var notificationDelegate: NotificationDelegate
    @StateObject var informVM = InformDetailViewModel()
    @State private var actionSheetData: ActionSheetData? = nil
    let idInforme: Int

    
    init(informId:Int) {
        self.idInforme = informId
    }
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            
            VStack(spacing:15){
            if let inform = informVM.inform {
                // First Card details of stay
                VStack(alignment: .center, spacing: 15) {
                    
                    
                    Text(inform.titulo)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .layoutPriority(1)
                    HStack{
                        Text("Fecha:")
                            .font(.body)
                            .fontWeight(.bold)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                        Spacer(minLength: 2)
                        Text(inform.fecha,style: .date)
                            .font(.subheadline)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    
                    
                    
                    
                    if let responsableMedico = inform.responsableMedico {
                        HStack{
                        Text("Responsable Medico:")
                            .font(.body)
                            .fontWeight(.bold)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                            
                            Spacer(minLength: 2)
                            
                        Text(responsableMedico.fullName())
                            .font(.body)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.trailing)
                        }
                    }
                    
                    

                }.padding().background(
                    RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                        .fill(Color.offWhite)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                )
                
                // Second Cart Inform's description
                VStack(alignment:.center,spacing:15){
                    
                    Text("Descripción:")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                    Text(inform.descripcion)
                        .font(.body)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                }.padding()
                .background(
                    RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                        .fill(Color.offWhite)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                )
                
                
                
                if let procedureInforms = inform.procedimientoInforme,procedureInforms.count > 0 {
                    Text("Algunos procedimientos requieren su atención")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                    
                    VStack(alignment:.center,spacing:15){
                        
                        
                           
                                ForEach(procedureInforms, id:\.idProcedimiento) { procedureInform in
                                    ProcedureCellView(procedureInform: procedureInform)
                                    .onTapGesture{
                                        self.actionSheetData = ActionSheetData(title: "example", message: "example")
                                    }
                                }
                            

                    }
                    
                    
                    
                } else {
                    Text("No existen procedimientos relacionados con este informe")
                }
                

            }
        }
            .padding()
            
        .onAppear(perform:getInform)
        .onDisappear{
            print("dissapear")
            notificationDelegate.isInformPresented = false
        }
        .actionSheet(item: $actionSheetData) {
            data in
            createProcedureSheet(data: data)
        }.navigationTitle("Inform Detail").navigationBarTitleDisplayMode(.inline)
        }.background(Rectangle()
                        .fill(Color.offWhite)
                        .ignoresSafeArea(.all))
    }
    
    
    
    func createProcedureSheet(data: ActionSheetData) -> ActionSheet {
        return ActionSheet(title: Text("Autorizar procedimiento"), message: Text("Está seguro que desea autorizar este procedimiento médico, esta acción no se puede deshacer.")       ,
                    buttons: [
                        .destructive(Text("Autorizar"), action: { print("Aprobar")}),
                        .cancel(Text("Cancelar"))
        ])
    }
    
    
    func getInform() {
        print("performin")
        informVM.getInformDetails(informId: idInforme)
            
    }
    
    

    
    
}





struct InformDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InformDetailView(informId: 103)
    }
}




struct ActionSheetData: Identifiable {
    var id = UUID() // Conform to Identifiable
    let title: String
    let message: String
}
