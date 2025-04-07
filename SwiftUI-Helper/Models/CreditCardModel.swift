//
//  CreditCardModel.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 06.04.2025.
//

import Foundation
import SwiftUI

struct CreditCardModel: Hashable {
    
    let title: String
    let number: String
    let holder: String
    let expiration: String
    let secretCode: String
    let color: Gradient
    
    static var mock: [Self] {
        [
            CreditCardModel(title: "VISA",
                            number: "2200 3123 4235 1234",
                            holder: "Card Holder",
                            expiration: "12/27",
                            secretCode: "581",
                            color: Gradient(colors: [.blue, .purple])),
            CreditCardModel(title: "MasterCard",
                            number: "4400 6345 7251 9021",
                            holder: "Card Holder",
                            expiration: "09/28",
                            secretCode: "341",
                            color: Gradient(colors: [.red, .orange])),
            CreditCardModel(title: "Express",
                            number: "3400 4124 9435 8032",
                            holder: "Card Holder",
                            expiration: "10/28",
                            secretCode: "778",
                            color: Gradient(colors: [.green, .teal]))
        ]
    }
}
