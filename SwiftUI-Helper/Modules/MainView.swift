//
//  MainView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 26.12.2021.
//

import SwiftUI

struct MainView: View {
    
    private var screen = UIScreen.main.bounds
    
    @State var path = [Step]()
    
    var body: some View {
        NavigationStack(path: $path) {
            content
                .navigationTitle("MainView")
                .navigationBarTitleDisplayMode(.automatic)
                .background(Color.white)
                .navigationDestination(for: Step.self) { step in
                    switch step {
                    case .picker:
                        PickerScreenView()
                    }
                }
        }
    }
}

private extension MainView {
    
    var content: some View {
        VStack(alignment: .center, spacing: 30) {
            Spacer()
            stepbutton
            navLink
            navLink2
            navLink3
            navLink4
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
    
    var navLink3: some View {
        NavigationLink(destination: TestAnimationView()) {
            Label {
                Text("AnimationView")
                    .font(.system(size: 20))
                    .foregroundColor(.blue)
            } icon: { }
        }
        .frame(width: screen.width)
    }
    
    var navLink4: some View {
        NavigationLink(destination: ShapeView()) {
            Label {
                Text("ShapeView")
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
    
    var stepbutton: some View {
        Button("Picker") {
            path.append(.picker)
        }
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
