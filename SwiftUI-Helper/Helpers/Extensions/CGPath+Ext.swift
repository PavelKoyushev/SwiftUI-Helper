//
//  CGPath+Ext.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 12.02.2025.
//

import SwiftUI

extension CGPath {
    
    func points() -> [CGPoint] {
        var points: [CGPoint] = []
        self.applyWithBlock { element in
            switch element.pointee.type {
            case .moveToPoint, .addLineToPoint:
                points.append(element.pointee.points[0])
            case .addQuadCurveToPoint:
                points.append(element.pointee.points[1])
            case .addCurveToPoint:
                points.append(element.pointee.points[2])
            default:
                break
            }
        }
        return points
    }
}
