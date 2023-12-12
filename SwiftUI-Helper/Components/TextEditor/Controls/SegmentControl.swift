//
//  SegmentControl.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 12.12.2023.
//

import SwiftUI

struct SegmentControl: View {
    
    @Binding var selected: Segment
    
    var body: some View {
        Picker("", selection: $selected) {
            ForEach(Segment.allCases, id: \.self) { item in
                Text(item.title)
            }
        }
        .pickerStyle(.segmented)
    }
}

#Preview {
    SegmentControl(selected: .constant(.one))
}
