//
//  TestCustomProgressView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 26.10.2024.
//

import SwiftUI

struct TestCustomProgressView: View {
    
    @StateObject var viewModel = TestCustomProgressViewModel()
    
    var body: some View {
        content
    }
}

private extension TestCustomProgressView {
    
    var content: some View {
        VStack {
            Spacer()
            sliderView
            Spacer()
            progressView
        }
        .padding()
    }
    
    var sliderView: some View {
        VStack {
            Slider(value: $viewModel.progress, in: 0...100, step: 1)
            Text("Task \(viewModel.progress.formatted(.number))% complete")
        }
    }
    
    var progressView: some View {
        ProgressView(value: viewModel.progress, total: 100)
            .progressViewStyle(CustomProgressViewStyle())
    }
}

#Preview {
    TestCustomProgressView()
}
