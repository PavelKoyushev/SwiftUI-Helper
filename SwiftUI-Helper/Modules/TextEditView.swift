//
//  TextEditView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 26.12.2021.
//

import SwiftUI

struct TextEditView: View {
    
    @State private var comment: String = ""
    
    var body: some View {
        content
            .navigationTitle("TextEditView")
            .navigationBarTitleDisplayMode(.inline)
    }
}

private extension TextEditView {
    
    var content: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 0) {
                image
                commentView
                myButton
            }
        }
    }
    
    var image: some View {
        Image(systemName: "text.bubble.fill")
            .font(.system(size: 100))
            .foregroundColor(.blue)
    }
    
    var commentView: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Leave you comment")
                .font(.system(size: 16, weight: .bold, design: .default))
            TextEditorView(comment: $comment)
        }
        .padding()
    }
    
    var myButton: some View {
        MainButton(isDisabled: .constant(false),
                   text: "Clean",
                   action: onCleanTap)
        .frame(width: 200)
    }
}

private extension TextEditView {
    
    func onCleanTap() {
        comment = ""
    }
}

#Preview {
    TextEditView()
}
