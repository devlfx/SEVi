//
//  Shape.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 16/09/21.
//

import SwiftUI

struct CurvedSideRectangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint.zero)
        
        path.addLine(to: CGPoint(x:rect.maxX, y:rect.minY))
        
        path.addLine(to: CGPoint(x:rect.maxX, y:rect.maxY))
        
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY), control: CGPoint(x: rect.midX, y: rect.maxY+30))
        
        path.closeSubpath()
        
        return path
    }
    
}

struct CurvedSideRectangle_Previews: PreviewProvider {
    static var previews: some View {
        CurvedSideRectangle()
            .frame(height:300)
    }
}
