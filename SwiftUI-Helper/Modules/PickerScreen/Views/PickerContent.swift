//
//  PickerContent.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 12.12.2023.
//

import SwiftUI

struct PickerContent: View {
    
    @Binding var selected: Segment
    
    private var proxySelected: Binding<Segment?> {
        Binding<Segment?>(get: {
            self.selected
        }, set: {
            self.selected = $0 ?? .one
        })
    }
    
    var body: some View {
        content
    }
}

private extension PickerContent {
    
    @ViewBuilder
    var content: some View {
        if #available(iOS 17, *) {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(Segment.allCases, id: \.self, content: segmentContent)
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: proxySelected.projectedValue)
        } else {
            tabView
        }
    }
    
    var tabView: some View {
        TabView(selection: $selected) {
            ForEach(Segment.allCases, id: \.self, content: segmentContent)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
    
    @ViewBuilder
    func segmentContent(_ item: Segment) -> some View {
        switch item {
        case .one:
            FirstView()
        case .two:
            SecondView()
        }
    }
}

#Preview {
    PickerContent(selected: .constant(.one))
}
