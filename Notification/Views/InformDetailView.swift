//
//  InformDetailView.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 07/09/21.
//

import SwiftUI

struct InformDetailView: View {
    @StateObject var informVM = InformDetailViewModel()
    @State private var actionSheetData: ActionSheetData? = nil
    let informe: Inform

    
    init(inform:Inform) {
        self.informe = inform
    }
    
    var body: some View {
        
        VStack(alignment: .leading,spacing:15){
            if let inform = informVM.inform {
                
                Text(inform.titulo)
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(maxWidth:.infinity)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                
                
                Text(inform.fecha,style: .date)
                    .font(.title2)
                    .multilineTextAlignment(.trailing)
                
                
                
                
                if let responsableMedico = inform.responsableMedico {
                    Text("Responsable Medico: \(responsableMedico.fullName())")
                        .font(.title3)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                    
                }
                
                
                Text("Descripción:")
                    .font(.title3)
                    .fontWeight(.bold)
                Text(inform.descripcion)
                    .font(.body)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                
                if let procedureInforms = inform.procedimientoInforme,procedureInforms.count > 0 {
                    VStack{
                        Text("Algunos Procedimientos requieren su atención")
                            .font(.title3)
                            .fontWeight(.semibold)
                        List{
                            Section(header: Text("Procedimientos")){
                                ForEach(procedureInforms, id:\.idProcedimiento) { procedureInform in
                                    ProcedureCellView(procedureInform: procedureInform)
                                    .onTapGesture{
                                        self.actionSheetData = ActionSheetData(title: "example", message: "example")
                                    }
                                }
                            }
                        }
                    }
                    
                } else {
                    Text("No existen procedimientos relacionados con este informe")
                }
                
                Spacer()
            }
        }.padding()
        .onAppear(perform:getInform)
        .actionSheet(item: $actionSheetData) {
            data in
            createProcedureSheet(data: data)
        }
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
        informVM.getInformDetails(informId: informe.idInforme!)
            
    }
    
    

    
    
}

struct InformDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InformDetailView(inform: Inform.exampleInform())
    }
}




struct ActionSheetData: Identifiable {
    var id = UUID() // Conform to Identifiable
    let title: String
    let message: String
}
