//
//  MainView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 26.12.2021.
//

import SwiftUI

struct MainView: View {
    
    private var screen = UIScreen.main.bounds
    
    var body: some View {
        NavigationStack {
            content
                .navigationTitle("MainView")
                .navigationBarTitleDisplayMode(.automatic)
                .background(Color.white)
        }
    }
}

private extension MainView {
    
    var content: some View {
        VStack(alignment: .center, spacing: 40) {
            
            Spacer()
            
            navLink
            
            navLink2
            
            myButton
            
            Spacer()
        }
    }
    
    var navLink: some View {
        NavigationLink(destination: TextEditView()) {
            Label {
                Text("TextEditView")
                    .font(.system(size: 20))
                    .foregroundColor(.blue)
            } icon: { }
        }
        .frame(width: screen.width)
    }
    
    var navLink2: some View {
        NavigationLink(destination: CardsView()) {
            Label {
                Text("ScrollView")
                    .font(.system(size: 20))
                    .foregroundColor(.blue)
            } icon: { }
        }
        .frame(width: screen.width)
    }
    
    var myButton: some View {
        MainButton(isDisabled: .constant(false),
                   text: "My Button",
                   action: action)
        .frame(width: 200)
    }
}

private extension MainView {
    
    func action() {
        print("button pressed")
    }
}
#Preview {
    MainView()
}
