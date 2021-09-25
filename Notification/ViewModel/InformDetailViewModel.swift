//
//  InformDetailViewModel.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 08/09/21.
//

import Foundation




import Combine
import UIKit


class InformDetailViewModel:ObservableObject, ProcedureAuthorizable{
    @Published var inform: Inform?
    @Published var error: String?
    @Published var isLoading: Bool = false
    
    var subscriptions = Set<AnyCancellable>()
    
    func authorizeProcedure(withIdentificator id: Int, completion: (() -> Void)?) {
        print(id)
        let procedureAuth = ProcedureAuth(idProcedimientoInforme: id)
        
        ApiClient.shared.postProcedureInformAuth(procedureInformAuth: procedureAuth)
        #if DEBUG
            .print()
        #endif
            .sink(
                receiveCompletion: {
                    [weak self] completionEvent in
                    guard let self = self else { return }
                    
                    switch completionEvent{
                    case .finished:
                        self.error = ""
                    case .failure(let err):
                        #if DEBUG
                            print(err)
                        #endif
                        self.error = "Ocurrió un error durante la autenticación"
                        
                    }
                    self.isLoading = false
                    completion?()
                }
                  
                , receiveValue: {})
            .store(in: &subscriptions)
                    
    }
    
    
    
    func getInformDetails(informId: Int){
        ApiClient.shared.getInform(informId: informId)
            .catch { _ in Empty<Inform?,Never>() }
            .assign(to:&$inform)
    }
    
}
