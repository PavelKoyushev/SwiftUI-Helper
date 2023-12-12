//
//  PickerScreenView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 12.12.2023.
//

import SwiftUI

struct PickerScreenView: View {
    
    @State private var selected: Segment = .one
    
    var body: some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Picker Screen")
    }
}

private extension PickerScreenView {
    
    var content: some View {
        VStack(spacing: 12) {
            SegmentControl(selected: $selected.animation())
                .padding(.horizontal)
            PickerContent(selected: $selected)
        }
    }
}

#Preview {
    PickerScreenView()
}
