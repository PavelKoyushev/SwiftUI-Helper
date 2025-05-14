//
//  MainViewModel.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 13.05.2025.
//

import Foundation
import Combine

final class MainViewModel: ObservableObject {
    
    let steps: [Step] = Step.main
    @Published var path = [Step]()
}

extension MainViewModel {
    
    func push(to step: Step) {
        path.append(step)
    }
}
