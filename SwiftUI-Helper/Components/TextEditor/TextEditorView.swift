//
//  TextEditorView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 26.12.2021.
//

import SwiftUI

struct TextEditorView: View {
    
    @Binding var comment: String
    
    init(comment: Binding<String>) {
        self._comment = comment
        
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            placeholder
                .padding(.leading, 10)
                .padding(.top, 7)
            textEditor
        }
        .padding()
        .background(Color(.sRGB, red: 0.85, green: 0.85, blue: 0.85, opacity: 1))
        .cornerRadius(10)
        .overlay(border)
    }
}

// MARK: - Views
private extension TextEditorView {
    
    var placeholder: some View {
        Text(comment.isEmpty ? "Please write your comment" : "")
            .foregroundColor(.gray)
            .font(.system(size: 14, weight: .regular, design: .default))
    }
    
    var textEditor: some View {
        TextEditor(text: $comment)
            .background(Color.clear)
            .foregroundColor(Color.black)
            .font(.system(size: 14, weight: .regular, design: .default))
            .frame(height: 80)
            .cornerRadius(10)
    }
    
    var border: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(Color.gray, lineWidth: 1)
    }
}

// MARK: - Methods
private extension TextEditorView {
    
}

struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView(comment: .constant(""))
    }
}
