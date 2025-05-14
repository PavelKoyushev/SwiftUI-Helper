//
//  TestScrollView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 21.10.2024.
//

import SwiftUI

struct TestScrollView: View {
    
    @StateObject var viewModel = TestScrollViewModel()
    
    var body: some View {
        content
            .navigationTitle(Text("PaginationScrollView"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.white, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .background(Color.blue.opacity(0.8).ignoresSafeArea())
            .onAppear(perform: onAppear)
    }
}

private extension TestScrollView {
    
    var content: some View {
        PaginationScrollView(paginationState: $viewModel.paginationState,
                             paginationAction: onPagination,
                             reloadPaginationAction: onReloadPagination,
                             content: scrollContent)
    }
    
    func scrollContent() -> some View {
        LazyVStack(spacing: 12) {
            ForEach(viewModel.model, id: \.self) { item in
                Text("\(item)")
                    .bold()
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal)
            }
        }
        .padding(.top)
        .padding(.bottom, viewModel.paginationState == .initial ? 20 : 0)
    }
}

private extension TestScrollView {
    
    func onAppear() {
        viewModel.getCells()
    }
    
    func onPagination() {
        viewModel.getNextPage()
    }
    
    func onReloadPagination() {
        
    }
}

#Preview {
    TestScrollView()
}
