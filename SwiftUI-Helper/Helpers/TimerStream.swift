//
//  TimerStream.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 08.07.2025.
//

import SwiftUI

struct TimerStream {
    
    static func timerPositionFire() -> AsyncStream<FireballAnimation> {
        AsyncStream { continuation in
            let cancellable = Timer
                .publish(every: 0.7, on: .main, in: .common)
                .autoconnect()
                .sink { time in
                    let x = CGFloat.random(in: 50...UIScreen.main.bounds.width - 50)
                    let y = CGFloat.random(in: 50...UIScreen.main.bounds.height - 50)
                    continuation.yield(.position(CGPoint(x: x, y: y)))
                }
            
            continuation.onTermination = { _ in
                cancellable.cancel()
            }
        }
    }
    
    static func timerStyleFire() -> AsyncStream<FireballAnimation> {
        AsyncStream { continuation in
            let cancellable = Timer
                .publish(every: 1.4, on: .main, in: .common)
                .autoconnect()
                .sink { time in
                    let size = CGFloat.random(in: 50...90)
                    let color = Color(hue: Double.random(in: 0.1...0.7),
                                      saturation: 0.8,
                                      brightness: 0.9)
                    continuation.yield(.style(size: size, color: color))
                }
            
            continuation.onTermination = { _ in
                cancellable.cancel()
            }
        }
    }
}
