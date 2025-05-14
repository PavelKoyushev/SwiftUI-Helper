//
//  GlobalViewObject.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 10.11.2024.
//

import SwiftUI

final class GlobalSnackBarObject: ObservableObject {
    
    @Published var isShow: Bool = false
    var message: String = ""
}

struct GlobalViewKey: EnvironmentKey {
    
    static let defaultValue = GlobalSnackBarObject()
}

extension EnvironmentValues {
    
    var globalSnackBar: GlobalSnackBarObject {
        get { self[GlobalViewKey.self] }
        set { self[GlobalViewKey.self] = newValue }
    }
}
