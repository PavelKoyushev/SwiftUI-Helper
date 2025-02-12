//
//  RoundedStar.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 12.02.2025.
//

import SwiftUI

struct RoundedStar: Shape {
    
    let cornerRadius: CGFloat
    private let points: Int = 5
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let outerRadius = min(rect.width, rect.height) / 2
        let innerRadius = outerRadius * 0.4
        
        let angleIncrement = .pi * 2 / CGFloat(points)
        let rotationOffset = CGFloat.pi / 2
        
        for i in 0..<points * 2 {
            let angle = angleIncrement * CGFloat(i) - rotationOffset
            let radius = i % 2 == 0 ? outerRadius : innerRadius
            let point = CGPoint(
                x: center.x + cos(angle) * radius,
                y: center.y + sin(angle) * radius
            )
            
            if i == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        
        path.closeSubpath()
        
        return path.roundedCorners(radius: cornerRadius)
    }
}
