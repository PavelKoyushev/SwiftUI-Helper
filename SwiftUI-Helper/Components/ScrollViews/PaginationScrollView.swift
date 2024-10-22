//
//  PaginationScrollView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 21.10.2024.
//

import SwiftUI

struct PaginationScrollView<Content: View>: View {
    
    private let showsIndicators: Bool
    private let offsetChanged: (CGPoint) -> Void
    
    @Binding private var paginationState: ScrollPaginationState
    
    private let paginationAction: () -> Void
    private let reloadPaginationAction: () -> Void
    private let content: Content
    
    public init(
        showsIndicators: Bool = true,
        offsetChanged: @escaping (CGPoint) -> Void = { _ in },
        paginationState: Binding<ScrollPaginationState>,
        paginationAction: @escaping () -> Void,
        reloadPaginationAction: @escaping () -> Void,
        @ViewBuilder content: () -> Content
    ) {
        self.showsIndicators = showsIndicators
        self.offsetChanged = offsetChanged
        
        self._paginationState = paginationState
        self.paginationAction = paginationAction
        self.reloadPaginationAction = reloadPaginationAction
        
        self.content = content()
    }
    
    var body: some View {
        contentView
    }
}

private extension PaginationScrollView {
    
    var contentView: some View {
        ScrollView(showsIndicators: showsIndicators) {
            VStack(spacing: 0) {
                geometryReader
                content
                contentState()
            }
        }
        .coordinateSpace(name: "scrollView")
        .onPreferenceChange(ScrollOffsetPreferenceKey.self, perform: offsetChanged)
    }
}

private extension PaginationScrollView {
    
    var geometryReader: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: ScrollOffsetPreferenceKey.self,
                                   value: geometry.frame(in: .named("scrollView")).origin)
        }
        .frame(width: 0, height: 0)
    }
    
    @ViewBuilder
    func contentState() -> some View {
        switch paginationState {
        case .initial:
            emptyView
        case .loader:
            processingView
        case .error:
            errorView
        case .pagination:
            paginationContent()
        }
    }
    
    var emptyView: some View {
        EmptyView()
    }
    
    var processingView: some View {
        LoaderView()
            .padding(.vertical, 20)
    }
    
    var errorView: some View {
        ErrorPaginationView(action: reloadPaginationAction)
            .padding(.vertical, 20)
    }
    
    @ViewBuilder
    func paginationContent() -> some View {
        GeometryReader { proxy -> Color in
            let minY = proxy.frame(in: .global).minY
            let height = UIScreen.main.bounds.height / 0.8
            
            if minY < height {
                DispatchQueue.main.async {
                    paginationAction()
                }
            }
            return Color.clear
        }
    }
}

private struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {}
}
