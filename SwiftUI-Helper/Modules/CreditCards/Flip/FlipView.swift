//
//  FlipView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 05.04.2025.
//

import SwiftUI

struct FlipView<Front: View, Back: View>: View {
    
    let front: Front
    let back: Back
    
    private let animateDuration: Double = 1
    private let width: CGFloat = 300
    
    @State private var flipProgress: Double = 0.0
    @State private var degree: Double = 0
    @State private var isDisableTap: Bool = false
    
    var body: some View {
        ZStack {
            FlipContainer(content: back,
                          isFront: false,
                          flipProgress: flipProgress,
                          action: onBackTap)
            FlipContainer(content: front,
                          flipProgress: flipProgress,
                          action: onFrontTap)
        }
        .disabled(isDisableTap)
        .frame(width: width, height: 180)
        .rotation3DEffect(.degrees(degree), axis: (x: 0, y: 1, z: 0))
        .animation(.easeInOut(duration: animateDuration), value: flipProgress)
        .onChange(of: degree, perform: onChangeDegree)
    }
}

private extension FlipView {
    
    func onChangeDegree(_ value: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + animateDuration) {
            print("Animation completed!")
            isDisableTap = false
        }
    }
    
    func onBackTap(_ location: CGPoint) {
        isDisableTap = true
        flipProgress = 0
        let left = width / 2
        
        if location.x <= left {
            degree += 180
        } else {
            degree -= 180
        }
    }
    
    func onFrontTap(_ location: CGPoint) {
        isDisableTap = true
        flipProgress = 1
        let left = width / 2
        
        if location.x <= left {
            degree -= 180
        } else {
            degree += 180
        }
    }
}
