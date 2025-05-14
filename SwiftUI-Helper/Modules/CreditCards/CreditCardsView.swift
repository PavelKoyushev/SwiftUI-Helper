//
//  CreditCardsView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 06.04.2025.
//

import SwiftUI

struct CreditCardsView: View {
    
    var body: some View {
        content
            .navigationTitle(Text("My credit cards"))
    }
}

private extension CreditCardsView {
    
    var content: some View {
        ScrollView {
            VStack {
                balance
                cards
            }
            .padding(.bottom)
        }
        .scrollIndicators(.hidden)
    }
    
    var balance: some View {
        HStack {
            Text("Balance")
                .font(.title)
            Spacer()
            Text("$2532.5")
                .font(.title)
        }
        .padding(.horizontal)
        .padding(.bottom, 24)
    }
    
    var cards: some View {
        ForEach(CreditCardModel.mock, id: \.self) { model in
            FlipView(front: CardFrontView(model: model),
                     back: CardBackView(code: model.secretCode, color: model.color))
        }
    }
}

#Preview {
    CreditCardsView()
}
