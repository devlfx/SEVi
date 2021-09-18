//
//  PrincipalView.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 29/08/21.
//

import SwiftUI


struct PrincipalView: View {
    
    @StateObject var stayFeedViewModel = StayFeedViewModel()
    private var gradientColors = Gradient(colors: [Color.white,Color.offWhite,Color("PrincipalL")])
    var body: some View {
        ZStack{
            
            Color.offWhite
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(spacing:15){
                    ForEach(stayFeedViewModel.stays,id:\.idEstancia) { stay in
                        NavigationLink(
//                            destination: StayDetailView(stay: stay),
                            destination:DetailContainerView(stay: stay),
                            label: {
                                StayCellView(stay: stay)
                            
                            
                            
                            })
                        
                    }
                }
                .padding(.horizontal)
                
            }
        }
        
            //.background(linearGradient)
        .onAppear(perform:fetch)
        .navigationTitle("Estancias")
        .toolbar {
            Button("Help") {
                print("Help tapped!")
            }
        }
        
    }
    
    
    private func fetch() {
            print("fetching")
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
