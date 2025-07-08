//
//  FireballViewModel.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 08.07.2025.
//

import SwiftUI
import Foundation
import AsyncAlgorithms

final class FireballViewModel: ObservableObject {
    
    @Published private(set) var state = FireballState.startModel
    @Published private(set) var isShowBall: Bool = true
    
    private var task: Task<Void, Never>?
    
    deinit {
        stopStream()
        print("\(Self.self) deinited")
    }
}

extension FireballViewModel {
    
    func start() {
        task = Task { [weak self] in
            let positionStream = TimerStream.timerPositionFire()
            let styleStream = TimerStream.timerStyleFire()
            
            let merged = merge(positionStream, styleStream)
            
            for await animation in merged {
                
                await MainActor.run { [weak self] in
                    withAnimation(.easeInOut(duration: 0.6)) {
                        switch animation {
                        case .position(let point):
                            self?.state.position = point
                        case .style(let size, let color):
                            self?.state.size = size
                            self?.state.color = color
                        }
                    }
                }
            }
        }
    }
    
    func hideFireBall() {
        DispatchQueue.main.async { [weak self] in
            self?.stopStream()
            self?.isShowBall = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                self?.state = FireballState.startModel
                self?.isShowBall = true
                self?.start()
            }
        }
    }
    
    func stopStream() {
        DispatchQueue.main.async { [weak self] in
            self?.task?.cancel()
            self?.task = nil
        }
    }
}
