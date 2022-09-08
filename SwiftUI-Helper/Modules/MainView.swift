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
        NavigationView {
            content
                .navigationTitle("MainView")
                .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

private extension MainView {
    
    var content: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 0) {
                
                navLink
                    .padding(.vertical, 30)
                
                myButton
                
                Spacer()
            }
        }
        .background(Color.white)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
