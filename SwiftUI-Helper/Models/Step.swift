//
//  Step.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 12.12.2023.
//

import Foundation

enum Step: Identifiable {
    
    var id: Int { hashValue }
    
    case textEdit
    case testScrollView
    case cards
    case animationView
    case shapeView
    case creditCardsView
    case pickerView
    case customProgressView
    case testBaseButtonView
    
    case otherScreen
}

extension Step {
    
    var name: String {
        switch self {
        case .textEdit:
            return "Controls"
        case .testScrollView:
            return "Pagination ScrollView"
        case .cards:
            return "Cards list"
        case .animationView:
            return "Image animation"
        case .shapeView:
            return "Shapes View"
        case .creditCardsView:
            return "Credit Cards animation"
        case .pickerView:
            return "PickerView"
        case .customProgressView:
            return "Custom ProgressView"
        case .testBaseButtonView:
            return "Base Button view"
        case .otherScreen:
            return "otherScreen"
        }
    }
}

extension Step {
    
    static var main: [Self] {
        [
            .testScrollView,
            .testBaseButtonView,
            .cards,
            .creditCardsView,
            .customProgressView,
            .animationView,
            .shapeView,
            .textEdit,
            .pickerView
        ]
    }
}
