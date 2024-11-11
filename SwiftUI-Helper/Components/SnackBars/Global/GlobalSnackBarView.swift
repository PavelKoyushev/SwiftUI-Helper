//
//  GlobalSnackBarView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 10.11.2024.
//

import SwiftUI

struct GlobalSnackBarView: View {
    
    let message: String
    
    var body: some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
    }
}

private extension GlobalSnackBarView {
    
    var content: some View {
        Text(message)
            .font(.title2)
            .foregroundStyle(.white)
            .padding(.horizontal)
            .padding(.vertical, 12)
    }
}

#Preview {
    GlobalSnackBarView(message: "Text")
}
