//
//  SecondView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 12.12.2023.
//

import SwiftUI
import Charts

struct SecondView: View {
    
    private let indexs = [KPIndex(day: 1, value: 3),
                          KPIndex(day: 2, value: 4),
                          KPIndex(day: 3, value: 5),
                          KPIndex(day: 4, value: 3),
                          KPIndex(day: 5, value: 5)]
    
    var body: some View {
        content
            .frame(width: UIScreen.main.bounds.width)
    }
}

private extension SecondView {
    
    var content: some View {
        ScrollView {
            VStack {
                chart
                text
            }
            .padding(.top, 8)
            .padding(.bottom)
        }
    }
    
    var chart: some View {
        Chart {
            ForEach(indexs, id: \.self) { index in
                BarMark(x: .value("Day", String(index.day)),
                        y: .value("Index", index.value))
                .foregroundStyle(index.value > 4 ? Color.red : .green)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        .padding(.horizontal)
        .animation(.none)
    }
    
    var text: some View {
        Text("Help people understand complex data by focusing on what you want to communicate and who you’re communicating to. For example, suppose that you have a collection of colorful shapes.")
            .multilineTextAlignment(.leading)
            .padding(.horizontal)
    }
}

#Preview {
    SecondView()
}
