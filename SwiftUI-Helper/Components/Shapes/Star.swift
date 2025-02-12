//
//  Star.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 12.02.2025.
//

import SwiftUI

struct Star: Shape {
    
    private let count: Int = 5
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        let points = (0..<count).map { i -> CGPoint in
            let angle = CGFloat(i) * (2.0 * .pi / CGFloat(count)) - .pi / 2
            return CGPoint(
                x: center.x + cos(angle) * rect.width / 2,
                y: center.y + sin(angle) * rect.height / 2
            )
        }
        
        path.move(to: points[0])
        path.addLine(to: points[2])
        path.addLine(to: points[4])
        path.addLine(to: points[1])
        path.addLine(to: points[3])
        path.closeSubpath()
        
        return path
    }
}
