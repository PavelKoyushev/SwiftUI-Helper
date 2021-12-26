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
        VStack(alignment: .center, spacing: 0) {
            Image(systemName: "text.bubble.fill")
                .font(.system(size: 100))
                .foregroundColor(.blue)
            commentView
                .padding()
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(minHeight: 0, maxHeight: .infinity)
    }
    
    var commentView: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Leave you comment")
                .font(.system(size: 16, weight: .bold, design: .default))
            TextEditorView(comment: $comment)
        }
    }
}

struct TextEditView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditView()
    }
}
