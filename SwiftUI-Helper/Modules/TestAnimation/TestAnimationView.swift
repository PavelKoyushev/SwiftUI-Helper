//
//  TestAnimationView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 11.12.2024.
//

import SwiftUI
import HelperSwiftUI

struct TestAnimationView: View {
    
    @State private var selected: Bool = false
    
    var body: some View {
        content
    }
}

private extension TestAnimationView {
    
    var content: some View {
        ScrollView {
            VStack(spacing: 20) {
                imageBlock
                cells
            }
        }
        .scrollIndicators(.hidden)
        .ignoresSafeArea(edges: .top)
    }
    
    @ViewBuilder
    var imageBlock: some View {
        ZStack {
            if #available(iOS 17, *) {
                AvatarView(content: imageView(),
                           selected: $selected)
            } else {
                imageView()
            }
            info
        }
        .frameSquare(side: UIScreen.main.bounds.width)
    }
    
    var cells: some View {
        LazyVStack(spacing: 8) {
            ForEach(1...20, id: \.self) {
                Text("Meow \($0)")
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}

private extension TestAnimationView {
    
    func imageView() -> some View {
        Image("avatarCat")
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .frameSquare(side: UIScreen.main.bounds.width / 2)
    }
    
    var info: some View {
        VStack {
            Spacer()
            Text("The Cat")
                .font(.title)
            Text("Avatar")
                .font(.title3)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    TestAnimationView()
}
