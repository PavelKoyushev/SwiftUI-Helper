//
//  TestBaseButtonViewModel.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 12.10.2024.
//

import Combine

final class TestBaseButtonViewModel: ObservableObject {
    
    @Published var buttonState: BaseButtonState = .standard
    @Published var password: String = ""
    
    var cancellable: Set<AnyCancellable> = []
    
    init() {
        bind()
    }
    
    deinit {
        print("\(Self.self) deinited")
    }
}

extension TestBaseButtonViewModel {
    
    func bind() {
        
        $password
            .map {
                $0.isEmpty ? BaseButtonState.disabled : .standard
            }
            .assign(to: &$buttonState)
    }
}

extension TestBaseButtonViewModel {
    
    func method() {
        
        buttonState = .loader
        
        Task {
            try await Task.sleep(nanoseconds: 3000000000)
            await MainActor.run {
                buttonState = .standard
            }
        }
    }
}
