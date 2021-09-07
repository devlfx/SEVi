//
//  StayDetail.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 04/09/21.
//

import SwiftUI
import Combine

struct StayDetailView: View {
    @StateObject var stayDetailViewModel = StayDetailViewModel()
    var stayId: Int
    
    init(stayId : Int){
        self.stayId = stayId
    }
    
    var body: some View {
        VStack{
            if let stay = stayDetailViewModel.stay, let informes = stay.informes{
                StayCellView(stay: stay)
                List{
                    Section(header: Text("Informes")){
                        ForEach(informes,id:\.idInforme){
                            inform in
                            InformCellView(inform: inform)
                        }
                    }
                    
                }
                
                
                
            } else {
                Text("Ocurrio un error")
            }
        }.onAppear(perform:fetchStay)
    }

    
    func fetchStay(){
        stayDetailViewModel.getStayDetais(stayId:self.stayId)
    }

}

struct StayDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StayDetailView(stayId: 1)
    }
}
