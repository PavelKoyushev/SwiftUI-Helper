//
//  ErrorPaginationView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 21.10.2024.
//

import SwiftUI

struct ErrorPaginationView: View {
    
    let action: () -> Void
    
    var body: some View {
        content
            .frame(maxWidth: .infinity)
    }
}

private extension ErrorPaginationView {
    
    var content: some View {
        VStack(alignment: .center, spacing: 8) {
            cantToLoadPage
            button
        }
    }
    
    var cantToLoadPage: some View {
        Text("Failed to load data")
            .foregroundStyle(.white)
    }
    
    var button: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                Text("Repeat")
                    .foregroundStyle(.white)
                Image(systemName: "arrow.clockwise")
                    .resizable()
                    .frame(width: 12, height: 14)
                    .foregroundStyle(.white)
                    .padding(.bottom, 1)
            }
        }
    }
}

#Preview {
    ErrorPaginationView(action: {})
        .padding()
        .background(Color.blue.opacity(0.6))
}
