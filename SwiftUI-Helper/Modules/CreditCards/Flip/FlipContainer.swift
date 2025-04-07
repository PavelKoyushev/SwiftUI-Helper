//
//  FlipContainer.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 06.04.2025.
//

import SwiftUI

struct FlipContainer<Content: View>: View, Animatable {
    
    let content: Content
    
    var isFront: Bool = true
    var flipProgress: Double
    let action: (CGPoint) -> Void
    
    var animatableData: Double {
        get { flipProgress }
        set { flipProgress = newValue }
    }
    
    private var isVisible: Double {
        if isFront {
            flipProgress <= 0.5 ? 1 : 0
        } else {
            flipProgress > 0.5 ? 1 : 0
        }
    }
    
    var body: some View {
        content
            .opacity(isVisible)
            .onTapGesture(perform: action)
    }
}

#Preview {
    FlipContainer(content: Text(""),
                  isFront: true,
                  flipProgress: 1,
                  action: { _ in })
}
