//
//  MainButton.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 08.09.2022.
//

import SwiftUI

struct MainButton: View {
    
    @Binding var isDisabled: Bool
    
    let text: String
    let color: Color = .blue
    let action: () -> Void
    
    var body: some View {
        Button(action: action,
               label: { Text(text) })
        .cornerRadius(30)
        .disabled(isDisabled)
        .buttonStyle(MainButtonStyle(isDisabled: isDisabled))
    }
}

#if DEBUG
struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(isDisabled: .constant(false),
                  text: "Start",
                  action: {})
    }
}
#endif
