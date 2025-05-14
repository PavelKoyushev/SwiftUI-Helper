//
//  MainView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 26.12.2021.
//

import SwiftUI

struct MainView: View {
    
    private var screen = UIScreen.main.bounds
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            content
                .navigationTitle("MainView")
                .navigationBarTitleDisplayMode(.automatic)
                .background(Color.white)
                .navigationDestination(for: Step.self,
                                       destination: navigationContent)
        }
    }
}

private extension MainView {
    
    var content: some View {
        List(viewModel.steps) { item in
            Text(item.name)
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .onTapGesture {
                    onListTap(item)
                }
        }
    }
}

private extension MainView {
    
    @ViewBuilder
    func navigationContent(_ step: Step) -> some View {
        switch step {
        case .pickerView:
            PickerScreenView()
        case .textEdit:
            TextEditView()
        case .testScrollView:
            TestScrollView()
        case .cards:
            CardsView()
        case .animationView:
            TestAnimationView()
        case .shapeView:
            ShapeView()
        case .creditCardsView:
            CreditCardsView()
        case .customProgressView:
            TestCustomProgressView()
        case .testBaseButtonView:
            TestBaseButtonView()
        default:
            EmptyView()
        }
    }
}

private extension MainView {
    
    func onListTap(_ step: Step) {
        viewModel.push(to: step)
    }
}

#Preview {
    MainView()
}
