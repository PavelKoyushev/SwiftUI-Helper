//
//  FireballView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 08.07.2025.
//

import SwiftUI

struct FireballView: View {
    
    @StateObject private var viewModel = FireballViewModel()
    
    var body: some View {
        content
            .onAppear(perform: onAppear)
    }
}

private extension FireballView {
    
    var content: some View {
        ZStack {
            background
            fireball
        }
    }
    
    var background: some View {
        GeometryReader { geometry in
            Image(.field)
                .resizable()
                .aspectRatio(geometry.size, contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        }
    }
    
    @ViewBuilder
    var fireball: some View {
        if viewModel.isShowBall {
            Fireball(model: viewModel.state)
                .onTapGesture(perform: onFireBallTap)
        }
    }
}

private extension FireballView {
    
    func onAppear() {
        viewModel.start()
    }
    
    func onFireBallTap() {
        viewModel.hideFireBall()
    }
}
