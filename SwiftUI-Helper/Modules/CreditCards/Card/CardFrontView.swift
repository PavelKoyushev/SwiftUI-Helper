//
//  CardFrontView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 06.04.2025.
//

import SwiftUI

struct CardFrontView: View {
    
    let model: CreditCardModel
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(
                    gradient: model.color,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                )
            
            VStack(alignment: .leading, spacing: 10) {
                Text(model.title)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                
                Spacer()
                
                Text(model.number)
                    .font(.title2)
                    .foregroundColor(.white)
                
                HStack {
                    Text(model.holder)
                    Spacer()
                    Text(model.expiration)
                }
                .foregroundColor(.white)
                .font(.caption)
            }
            .padding()
        }
        .rotation3DEffect(.degrees(0), axis: (x: 0, y: 1, z: 0))
    }
}
