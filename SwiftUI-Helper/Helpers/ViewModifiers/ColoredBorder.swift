//
//  ColoredBorder.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 06.10.2024.
//

import SwiftUI

struct ColoredBorder: ViewModifier {
    
    let font: Font
    let textColor: Color
    let borderColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(textColor)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 2)
                    .fill(borderColor)
            )
    }
}
