//
//  BaseButtonState.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 18.10.2024.
//

enum BaseButtonState {
    
    case disabled
    case standard
    case loader
    
    var isDisabled: Bool {
        self != .standard
    }
    
    var isLoader: Bool {
        self == .loader
    }
}
