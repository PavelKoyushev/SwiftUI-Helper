//
//  MainView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 26.12.2021.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        NavigationView {
            content
                .navigationTitle("MainView")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

private extension MainView {
    
    var content: some View {
        VStack(alignment: .center, spacing: 0) {
            NavigationLink(destination: TextEditView()) {
                Label {
                    Text("TextEditView")
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                } icon: { }
            }
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(minHeight: 0, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
