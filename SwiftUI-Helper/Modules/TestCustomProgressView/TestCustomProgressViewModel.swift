//
//  TestCustomProgressViewModel.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 26.10.2024.
//

import Foundation

final class TestCustomProgressViewModel: ObservableObject {
    
    @Published var progress: Double = 0
    
    init() {
        bind()
    }
    
    deinit {
        print("\(Self.self) deinited")
    }
}

extension TestCustomProgressViewModel {
    
    func bind() {
        
    }
}
