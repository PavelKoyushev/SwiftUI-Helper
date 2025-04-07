//
//  CardBackView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 06.04.2025.
//

import SwiftUI

struct CardBackView: View {
    
    let code: String
    let color: Gradient
    
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(
                    gradient: color,
                    startPoint: .top,
                    endPoint: .bottom)
                )
            
            VStack(spacing: 15) {
                Rectangle()
                    .fill(Color.black)
                    .frame(height: 40)
                    .padding(.top, 20)
                
                HStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.white)
                        .frame(width: 200, height: 30)
                        .overlay(
                            Text(code)
                                .font(.caption)
                                .padding(.trailing, 10),
                            alignment: .trailing
                        )
                    Spacer()
                }

                Spacer()
            }
            .padding()
        }
        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
    }
}
