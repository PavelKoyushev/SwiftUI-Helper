//
//  AppButtonStyles.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 08.09.2022.
//

import SwiftUI

struct MainButtonStyle: ButtonStyle {
    
    var isDisabled: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .font(.system(size: 20, weight: .semibold))
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(isDisabled ? Color.gray : configuration.isPressed ? Color.indigo : Color.blue)
            .cornerRadius(30)
    }
}
