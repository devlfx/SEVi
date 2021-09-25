//
//  PrincipalView.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 29/08/21.
//

import SwiftUI


struct PrincipalView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @EnvironmentObject var notificationDelegate: NotificationDelegate
    @StateObject var stayFeedViewModel = StayFeedViewModel()

  
    
    var body: some View {
        ZStack{
            
            Rectangle()
                .fill(Color.offWhite)
                .ignoresSafeArea(.all, edges: [.bottom,.leading,.trailing])
                
            
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(spacing:15){
                    ForEach(stayFeedViewModel.stays,id:\.idEstancia) { stay in
                        
                        NavigationLink(
                            destination:DetailContainerView(stay: stay),
                            label: {
                                StayCellView(stay: stay)
                            
                            
                            
                            })
                        
                    }
                }
                .padding(.horizontal)
                
            }
            
            NavigationLink(
                destination: InformDetailView(informId: notificationDelegate.idInform),
              isActive: $notificationDelegate.isInformPresented) {
              EmptyView()
            }
            
        }
        
            //.background(linearGradient)
        .onAppear(perform:fetch)
        .navigationTitle(Text("Estancias"))
        
        .toolbar {
            

            
            Button(action: {
                authVM.logOut()
            }, label: {
                Text("Salir").foregroundColor(Color("Secondary"))
            })
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
            let vm = AuthViewModel()
            let appDelegate = AppDelegate()
            ContentView().environmentObject(vm)
                .environmentObject(appDelegate.notificationDelegate)
        }
        
    }
}
