//
//  Segment.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 12.12.2023.
//

import Foundation

enum Segment: CaseIterable {
    
    case one
    case two
    
    var title: String {
        switch self {
        case .one:
            return "One"
        case .two:
            return "Two"
        }
    }
}
