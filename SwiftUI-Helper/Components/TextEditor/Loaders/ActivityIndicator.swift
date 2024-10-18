//
//  ActivityIndicator.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 18.10.2024.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    var animating: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }
    
    func updateUIView(_ activityIndicator: UIActivityIndicatorView, context: Context) {
        if animating {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}
