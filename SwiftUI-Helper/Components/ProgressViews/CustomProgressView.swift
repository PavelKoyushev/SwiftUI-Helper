//
//  CustomProgressView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 26.10.2024.
//

import SwiftUI

struct CustomProgressView: View {
    
    let totalLines: Int
    let currentLine: Double
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0 ..< totalLines + 1, id: \.self) { item in
                Rectangle()
                    .frame(width: 4, height: 30)
                    .foregroundStyle(style(item))
                if item != totalLines {
                    Spacer(minLength: 0)
                }
            }
        }
    }
}

private extension CustomProgressView {
    
    func style(_ item: Int) -> Color {
        currentLine != 0 && Double(item) <= currentLine ? .green : .gray
    }
}

#Preview {
    CustomProgressView(totalLines: 45,
                       currentLine: 0.1)
}
