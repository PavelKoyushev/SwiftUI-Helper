//
//  Fireball.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 08.07.2025.
//

import SwiftUI
import HelperSwiftUI

struct Fireball: View {
    
    let model: FireballState
    
    var body: some View {
        Circle()
            .fill(model.color)
            .frameSquare(side: model.size)
            .position(model.position)
    }
}
