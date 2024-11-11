//
//  CardsView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 17.06.2023.
//

import SwiftUI
import HelperSwiftUI

struct CardsView: View {
    
    @Environment(\.globalSnackBar) var globalSnackBar
    
    var body: some View {
        content
            .navigationBarTitleDisplayMode(.inline)
    }
}

private extension CardsView {
    
    @ViewBuilder
    var content: some View {
        if #available(iOS 17, *) {
            ScrollView {
                LazyVStack {
                    ForEach(1..<20) { _ in
                        Color.purple
                            .frame(height: 120)
                            .cornerRadius(20)
                            .padding(.horizontal, 4)
                            .onTapGesture(perform: onCellTap)
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
        } else {
            scrollView
        }
    }
    
    var scrollView: some View {
        ScrollView {
            LazyVStack {
                ForEach(1..<20) { _ in
                    Color.purple
                        .frame(height: 120)
                        .cornerRadius(20)
                        .padding(.horizontal)
                        .onTapGesture(perform: onCellTap)
                }
            }
        }
    }
}

private extension CardsView {
    
    func onCellTap() {
        globalSnackBar.message = "The snack bar has appeared! \(Int.random(in: 1...100))"
        globalSnackBar.isShow = true
    }
}

#Preview {
    CardsView()
}
