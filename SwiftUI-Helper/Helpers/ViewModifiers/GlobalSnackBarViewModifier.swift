//
//  GlobalSnackBarViewModifier.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 10.11.2024.
//

import SwiftUI
import Combine

struct GlobalSnackBarViewModifier: ViewModifier {
    
    @State private var timer: Publishers.Autoconnect<Timer.TimerPublisher>? = nil
    @State private var subscription: AnyCancellable? = nil
    
    @State private var isShowed: Bool = false
    @State private var count = 0
    
    @Binding var isShow: Bool
    let message: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .top) {
            content
            snackBar
        }
        .onChange(of: isShow, perform: onChangeShow)
    }
}

private extension GlobalSnackBarViewModifier {
    
    @ViewBuilder
    var snackBar: some View {
        if isShowed {
            GlobalSnackBarView(message: message)
                .transition(.move(edge: .top))
        }
    }
    
    func onChangeShow(_ newValue: Bool) {
        DispatchQueue.main.async {
            withAnimation {
                isShowed = newValue
            }
            if newValue {
                count = 3
                timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                
                subscription = timer?.sink(receiveValue: { _ in
                    count -= 1
                    if count <= 0 {
                        timer = nil
                        subscription = nil
                        withAnimation() {
                            isShow = false
                        }
                    }
                })
            }
        }
    }
}
