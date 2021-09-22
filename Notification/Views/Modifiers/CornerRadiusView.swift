//
//  CornerRadiusView.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 16/09/21.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

