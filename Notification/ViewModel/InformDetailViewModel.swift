//
//  InformDetailViewModel.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 08/09/21.
//

import Foundation




import Combine


class InformDetailViewModel:ObservableObject {
    @Published var inform: Inform?
    var subscriptions = Set<AnyCancellable>()
    
    func getInformDetails(informId: Int){
        ApiClient.shared.getInform(informId: informId)
            .print()
            .catch { _ in Empty<Inform?,Never>() }
            .assign(to:&$inform)
    }
    
}
