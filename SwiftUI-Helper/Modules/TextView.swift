//
//  TextView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 06.10.2024.
//

import SwiftUI

struct TextView: View {
    
    var body: some View {
        content
    }
}

private extension TextView {
    
    var content: some View {
        ScrollView {
            coloredBorder
        }
    }
    
    var coloredBorder: some View {
        Text("Hello, World!")
            .coloredBorder(font: .system(.title2, weight: .medium),
                           textColor: .pink,
                           borderColor: .green)
            .padding()
    }
}

#Preview {
    TextView()
}
