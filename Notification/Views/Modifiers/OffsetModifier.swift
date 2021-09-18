//
//  OffsetModifier.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 16/09/21.
//

import SwiftUI

// Moddifier for getting a scrollview offset and stop from going past the upper limit... it looks kind of ugly

// This modifier will set the offset value to the contain of a view in function of a coordinate space configured to another view



struct OffsetModifier: ViewModifier {
    @Binding var offset: CGFloat
    var name:String = "Scroll"
    
    func body(content: Content) -> some View{
        content
            .overlay(
        GeometryReader {
            proxy -> Color in
            //
            let minY = proxy.frame(in:.named(name)).minY
            
            DispatchQueue.main.async {
                self.offset = minY
            }
            
            return Color.clear
        }
                , alignment: .top
        )
    }
}
