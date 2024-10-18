//
//  LoaderView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 18.10.2024.
//

import SwiftUI

struct LoaderView: View {
    
    private let animation = Animation.linear.repeatForever(autoreverses: false)
    private let gradient = LinearGradient(colors: [.white, .white.opacity(0.6)],
                                          startPoint: .leading, endPoint: .trailing)
    
    @State private var isLoading = false
    
    var body: some View {
        content
            .onAppear(perform: onAppear)
            .onDisappear(perform: onDisappear)
    }
}

private extension LoaderView {
    
    var content: some View {
        Circle()
            .trim(from: 0.0, to: 0.8)
            .stroke(gradient, lineWidth: 3)
            .frame(width: 28, height: 28)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(animation, value: isLoading)
    }
}

private extension LoaderView {
    
    func onAppear() {
        DispatchQueue.main.async {
            isLoading = true
        }
    }
    
    func onDisappear() {
        DispatchQueue.main.async {
            isLoading = false
        }
    }
}

#Preview {
    ScrollView {
        LoaderView()
    }
    .frame(maxWidth: .infinity)
    .background(Color.gray)
}
