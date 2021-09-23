//
//  DetailContainerView.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 16/09/21.
//

/**
 View container to obtain the sage area limit to ignore
 */
import SwiftUI

struct DetailContainerView: View {
    
    var stay:Stay
    
    var body: some View {
        GeometryReader{ proxy in
            
            let topEdge  = proxy.safeAreaInsets.top
            
            StayDetailView(topEdge: topEdge,stay: stay)
        }.ignoresSafeArea(.all,edges: .top)
    }
}

struct DetailContainerView_Previews: PreviewProvider {
    static var previews: some View {
        DetailContainerView(stay:Stay.example())
    }
}
