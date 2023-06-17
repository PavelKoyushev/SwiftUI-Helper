//
//  CardsView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 17.06.2023.
//

import SwiftUI

struct CardsView: View {
    
    var body: some View {
        content
            .navigationBarTitleDisplayMode(.inline)
    }
}

private extension CardsView {
    
    var content: some View {
        ScrollView {
            LazyVStack {
                ForEach(1..<20) { _ in
                    Color.purple
                        .frame(height: 120)
                        .cornerRadius(20)
                }
            }
        }
        .scrollIndicators(.hidden)
        .safeAreaInset(edge: .top) {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(1..<10) { _ in
                        Color.blue
                            .frame(height: 80)
                            .cornerRadius(20)
                            .containerRelativeFrame(.horizontal,
                                                    count: 5,
                                                    span: 2,
                                                    spacing: 8)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
            .padding(.vertical, 8)
            .fixedSize(horizontal: false, vertical: true)
            .background(.thinMaterial)
        }
        .safeAreaPadding(.horizontal)
    }
}

#Preview {
    CardsView()
}
