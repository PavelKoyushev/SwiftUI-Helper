//
//  View+Ext.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 18.10.2024.
//

import SwiftUI

extension View {
    
    func coloredBorder(font: Font, textColor: Color, borderColor: Color) -> some View {
        modifier(ColoredBorder(font: font,
                               textColor: textColor,
                               borderColor: borderColor))
    }
}
