//
//  PrincipalView.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 29/08/21.
//

import SwiftUI


struct PrincipalView: View {
    
    @StateObject var stayFeedViewModel = StayFeedViewModel()
    
    var body: some View {
        VStack{
                List{
                    ForEach(stayFeedViewModel.stays,id:\.idEstancia) { stay in
                        NavigationLink(
                            destination: StayDetailView(stayId: stay.idEstancia!),
                            label: {
                                StayCellView(stay: stay)
                            })
                        
                    }
                }
        }
        .onAppear(perform:fetch).navigationBarTitle("Estancias")
    }
    
    
    private func fetch() {
            stayFeedViewModel.getStays()
    }
}



struct PricipalContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PrincipalView()
        }
        
    }
}
