//
//  FireballState.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 08.07.2025.
//

import SwiftUI

struct FireballState {
    
    var position: CGPoint
    var size: CGFloat
    var color: Color
}

extension FireballState {
    
    static var startModel: Self {
        let position = CGPoint(x: CGFloat.random(in: 50...UIScreen.main.bounds.width - 50),
                               y: CGFloat.random(in: 50...UIScreen.main.bounds.height - 50))
        return .init(position: position,
                     size: CGFloat.random(in: 30...50),
                     color: .white)
    }
}
