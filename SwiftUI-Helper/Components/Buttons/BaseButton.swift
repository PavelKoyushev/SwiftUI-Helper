//
//  BaseButton.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 12.10.2024.
//

import SwiftUI

struct BaseButton: View {
    
    @Binding var state: BaseButtonState
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        content
            .buttonStyle(BaseButtonStyle(isLoader: state.isLoader))
            .disabled(state.isDisabled)
    }
}

private extension BaseButton {
    
    var content: some View {
        Button(action: action) {
            Text(title)
                .opacity(state.isLoader ? 0 : 1)
                .overlay {
                    LoaderView()
                        .opacity(state.isLoader ? 1 : 0)
                }
        }
    }
}

#Preview {
    VStack {
        BaseButton(state: .constant(.disabled),
                   title: "Sign Up",
                   action: {})
        
        BaseButton(state: .constant(.standard),
                   title: "Sign Up",
                   action: {})
        
        BaseButton(state: .constant(.loader),
                   title: "Sign Up",
                   action: {})
        
    }
    .padding(.horizontal)
}
