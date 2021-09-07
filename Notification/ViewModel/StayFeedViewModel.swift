//
//  PatientsFeedViewModel.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 29/08/21.
//

import Combine

class StayFeedViewModel:ObservableObject {
    @Published var stays: [Stay] = []
    var subscriptions = Set<AnyCancellable>()
    
    init(){
    }
    
    func getStays(){
        let publisher = ApiClient.shared.getStays()
        
        publisher
            .catch { _ in Empty<[Stay],Never>() }
            .assign(to:&$stays)
            
    }
    
    
    
    
}
