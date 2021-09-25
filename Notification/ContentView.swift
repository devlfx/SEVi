//
//  ContentView.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 14/07/21.
//

import SwiftUI
import Combine






struct ContentView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    @State var animate: Bool = false
    @State var showSplash: Bool = true
    
    var body: some View {
        ZStack{
            NavigationView {
                if viewModel.isSignedIn {
                    PrincipalView()
                        .animation(Animation.easeOut(duration: 0.5))
                        .opacity(viewModel.isSignedIn ? 1 : 0)

                } else {
                    SignInView()
                }
            }.navigationViewStyle(StackNavigationViewStyle())
                

            ZStack{
                Color.white
                
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100, alignment: .center)
                    .scaleEffect(animate ? 8 : 1)
                    .animation(Animation.easeOut(duration: 0.6))
            }
            .ignoresSafeArea(.all)
            .opacity(showSplash ? 1 : 0)
            
        
        }
        .onAppear{
            checkToken()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.animate.toggle()
                }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.easeOut(duration: 0.5)){
                    self.showSplash.toggle()
                }
                

                
            }
        }
    }
    
    private func checkToken(){
        print("checando token")
        viewModel.checkToken()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = AuthViewModel()
        let appDelegate = AppDelegate()
        ContentView().environmentObject(vm)
            .environmentObject(appDelegate.notificationDelegate)
    }
}





