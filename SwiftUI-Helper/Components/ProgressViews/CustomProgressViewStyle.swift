//
//  CustomProgressViewStyle.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 26.10.2024.
//

import SwiftUI

struct CustomProgressViewStyle: ProgressViewStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        let fraction = configuration.fractionCompleted!
        let totalLines = Int(Int((UIScreen.main.bounds.width - 32) / 4) / 2)
        let currentLine = Double(totalLines) * fraction
        
        return CustomProgressView(totalLines: totalLines,
                                  currentLine: currentLine)
    }
}
