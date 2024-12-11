//
//  AvatarView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 11.12.2024.
//

import SwiftUI

@available(iOS 17, *)
struct AvatarView<Content: View>: View {
    
    var content: Content
    
    @Binding var selected: Bool
    
    var body: some View {
        content
            .animation(.smooth) {
                $0.shadow(radius: selected ? 12 : 8)
            }
            .animation(.bouncy) {
                $0.scaleEffect(selected ? 1.2 : 1.0)
            }
            .onTapGesture(perform: onTap)
    }
}

@available(iOS 17, *)
private extension AvatarView {
    
    func onTap() {
        selected.toggle()
    }
}
