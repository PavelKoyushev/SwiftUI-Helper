//
//  FirstView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 12.12.2023.
//

import SwiftUI

struct FirstView: View {
    
    var body: some View {
        content
            .frame(width: UIScreen.main.bounds.width)
    }
}

private extension FirstView {
    
    var content: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(1..<30) { item in
                    HStack {
                        Text(item.description)
                            .foregroundStyle(.white)
                            .font(.title2)
                    }
                    .frame(maxWidth: .infinity, minHeight: 80)
                    .background(.secondary)
                    .cornerRadius(20)
                    .padding(.horizontal)
                }
            }
            .padding(.top, 8)
            .padding(.bottom)
        }
    }
}

#Preview {
    FirstView()
}
