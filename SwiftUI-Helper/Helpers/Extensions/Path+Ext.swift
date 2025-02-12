//
//  Path+Ext.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 12.02.2025.
//

import SwiftUI

extension Path {
    
    func roundedCorners(radius: CGFloat) -> Path {
        
        var path = Path()
        let points = self.cgPath.points()
        
        for i in 0..<points.count {
            let previous = points[(i + points.count - 1) % points.count]
            let current = points[i]
            let next = points[(i + 1) % points.count]
            
            let start = CGPoint(
                x: current.x + (previous.x - current.x) * radius,
                y: current.y + (previous.y - current.y) * radius
            )
            let end = CGPoint(
                x: current.x + (next.x - current.x) * radius,
                y: current.y + (next.y - current.y) * radius
            )
            
            if i == 0 {
                path.move(to: start)
            } else {
                path.addLine(to: start)
            }
            
            path.addQuadCurve(to: end, control: current)
        }
        
        path.closeSubpath()
        return path
    }
}
