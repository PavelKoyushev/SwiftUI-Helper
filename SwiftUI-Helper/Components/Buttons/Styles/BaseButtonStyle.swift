//
//  BaseButtonStyle.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 18.10.2024.
//

import SwiftUI

struct BaseButtonStyle: ButtonStyle {
    
    @Environment(\.isEnabled) var isEnabled
    let isLoader: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .font(.system(size: 22, weight: .semibold))
            .multilineTextAlignment(.center)
            .padding(.horizontal, 16)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(configuration.isPressed ? .purple.opacity(0.7) : (isEnabled ? .purple : isLoader ? .purple : .gray))
            .cornerRadius(30)
    }
}
