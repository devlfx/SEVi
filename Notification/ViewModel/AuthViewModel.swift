//
//  AuthViewModel.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 26/08/21.
//

import Foundation
import Combine


class AuthViewModel:ObservableObject{
    @Published var isSignedIn = false
    @Published var error = ""
    var subscriptions = Set<AnyCancellable>()
    var credentials: Credentials?
    var responsable: Responsable?
    
    
    init(){
    }
    
    func signIn(email:String, password:String){
        credentials = Credentials(email: email, password: password)
        let publisher = ApiClient.shared.login(credentials: credentials!)
        publisher.sink(receiveCompletion: {
                completion in
                switch completion{
                    case .finished:
                        self.isSignedIn = true
                        self.error = ""
                        
                    case .failure(let err):
                        #if DEBUG
                            print(err)
                        #endif
                        self.error = "Ocurrió un error durante la autenticación"
                }
            }, receiveValue:{ value in
                self.storeAccountData(data:value)
            } )
            .store(in: &subscriptions)
    }
    
    
    func storeAccountData(data:TokenResponse){
        APIConfig.shared.setApiToken(data.token)
        if let credentials = credentials {
            CurrentUser.shared.setCredential(credentials: credentials)
        }
        credentials = nil
        responsable = data.user
        // store user
    }
    
    func checkToken() {
        let token = try? KeychainStore.common.getItem(forKey: "notification.apitoken")
        if let _ = token {
            self.isSignedIn = true
        }
    }
    
    
}
