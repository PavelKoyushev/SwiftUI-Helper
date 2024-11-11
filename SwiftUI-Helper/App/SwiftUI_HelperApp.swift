//
//  SwiftUI_HelperApp.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 26.12.2021.
//

import SwiftUI

@main
struct SwiftUI_HelperApp: App {
    
    @StateObject private var object = GlobalSnackBarObject()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(.light)
                .environment(\.globalSnackBar, object)
                .snackBarView(isShow: $object.isShow,
                              message: object.message)
        }
    }
}
