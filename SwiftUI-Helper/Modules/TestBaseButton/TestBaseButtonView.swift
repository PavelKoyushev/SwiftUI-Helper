//
//  TestBaseButtonView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 12.10.2024.
//

import SwiftUI

struct TestBaseButtonView: View {
    
    @StateObject var viewModel = TestBaseButtonViewModel()
    
    var body: some View {
        content
    }
}

private extension TestBaseButtonView {
    
    var content: some View {
        ScrollView {
            textField
        }
        .safeAreaInset(edge: .bottom,
                       content: button)
    }
    
    var textField: some View {
        TextField("Password", text: $viewModel.password)
            .padding()
            .background(Color.gray.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding()
    }
    
    func button() -> some View {
        BaseButton(state: $viewModel.buttonState,
                   title: "Sign Up",
                   action: onButtonTap)
        .padding()
    }
}

private extension TestBaseButtonView {
    
    func onButtonTap() {
        viewModel.method()
    }
}

#Preview {
    TestBaseButtonView()
}
