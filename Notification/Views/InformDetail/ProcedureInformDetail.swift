//
//  ProcedureInformDetail.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 22/09/21.
//

import SwiftUI

struct ProcedureInformDetail: View {
    @Environment(\.presentationMode) var presentation
    @State var sheetData: ActionSheetData? = nil
    @ObservedObject var informVM : InformDetailViewModel
    
    
    
    
    let procedureInform:ProcedureInform
    
    var body: some View {
        ScrollView{
            
            VStack(alignment: .center, spacing: 15){
                Spacer(minLength: 2)
                Text(procedureInform.procedimiento.nombre)
                    .font(.title3)
                    .fontWeight(.semibold)
                    
                Text(procedureInform.procedimiento.descripcion)
                    .font(.body)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    )
            }
            .padding(.horizontal)
            
            VStack(alignment: .center, spacing: 15){
                Text("Justificacion")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                    
                Text(procedureInform.justificacion)
                    .font(.body)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    )
            }
            .padding(/*@START_MENU_TOKEN@*/[.top, .leading, .trailing]/*@END_MENU_TOKEN@*/)
            
            
            HStack(alignment: .center, spacing: 15){
                Spacer(minLength: 2)
                Button(action: {
                    self.sheetData = ActionSheetData(title: "", message: "",idprocedureInform: procedureInform.idProcedimientoInforme ?? 0)
                }){
                    Text("Autorizar")
                        .foregroundColor(Color.red)
                        .font(.body)
                        .fontWeight(.bold)
                        
                        
                }.padding()
                    .frame(width: 150)
                    .background(
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                                    .fill(Color.offWhite)
                                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5))
                
                Spacer(minLength: 2)
                
                Button(action: {
                    self.presentation.wrappedValue.dismiss()
                }){
                    Text("Cancelar")
                        .foregroundColor(Color("Principal"))
                        .font(.body)
                        .fontWeight(.bold)
                        
                        
                        
                        
                }
                .padding()
                .frame(width: 150)
                .background(
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                                    .fill(Color.offWhite)
                                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5))
                Spacer(minLength: 2)
                
            }.padding([.top, .leading, .trailing])
            Spacer()
            
            
        }
        .background(
            Color.offWhite.ignoresSafeArea(.all)
        )
        .actionSheet(item: self.$sheetData) {
            sheetData in
            createProcedureSheet(data: sheetData)
        }
    }
    
    
    
    
    func createProcedureSheet(data: ActionSheetData) -> ActionSheet {
        return ActionSheet(title: Text("Autorizar procedimiento"), message: Text("Está seguro que desea autorizar este procedimiento médico, esta acción no se puede deshacer.")       ,
                    buttons: [
                        .destructive(Text("Autorizar"), action: {
                            
                            self.informVM.authorizeProcedure(withIdentificator: data.idprocedureInform) {
                                self.informVM.getInformDetails(informId: self.procedureInform.idInforme)
                                self.presentation.wrappedValue.dismiss()
                            }
                            
                            
                            
                            
                        }),
                        .cancel(Text("Cancelar"))
        ])
    }
    
    
    
}

struct ProcedureInformDetail_Previews: PreviewProvider {
    static var vm = InformDetailViewModel()
    static var previews: some View {
        ProcedureInformDetail(informVM:ProcedureInformDetail_Previews.vm ,procedureInform: ProcedureInform.example())
    }
}



struct ActionSheetData: Identifiable {
    var id = UUID() // Conform to Identifiable
    let title: String
    let message: String
    let idprocedureInform: Int
}
