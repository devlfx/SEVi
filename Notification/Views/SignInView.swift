//
//  SignInView.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 27/08/21.
//

import SwiftUI

struct SignInView: View {
    @State var email = "laog18@gmail.com"
    @State var password = "Hola123."
    @EnvironmentObject var authVM : AuthViewModel
    
    var body : some View {
        
        VStack{
            Image("logo")
                .resizable()
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .scaledToFit()
                .frame(width: 150, height: 150)
        
            VStack {
                TextField("Email",text:$email)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(30)
                SecureField("Password",text:$password).padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(30)
                    Text(authVM.error)
                
                Button(action: {
                    authVM.signIn(email: email, password: password)
                }, label: {
                    Text("Sign in")
                    .padding(EdgeInsets(top: 10, leading: 10,
                                            bottom: 10, trailing: 10))
                        .foregroundColor(.white)
                        .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color("Principal"))
                        .cornerRadius(40)
                })
                .padding(EdgeInsets(top: 10, leading: 10,
                            bottom: 10, trailing: 10))
                
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle("Sign in")
    }
        
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = AuthViewModel()
        NavigationView{
            SignInView().environmentObject(vm)
        }
        
        

    }
}
