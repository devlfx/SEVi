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
    
    var body: some View {
        NavigationView {
            if viewModel.isSignedIn {
                PrincipalView()
            } else {
                SignInView()
            }
            
            
        }.onAppear(perform: checkToken).navigationViewStyle(StackNavigationViewStyle())
    }
    
    
    private func checkToken(){
        print("checando token")
        viewModel.checkToken()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = AuthViewModel()
        ContentView().environmentObject(vm)

    }
}
