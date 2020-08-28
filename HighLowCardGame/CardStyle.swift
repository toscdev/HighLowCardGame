//
//  HighLowCardGame
//  COPYRIGHT © 2020 Tobias Schaarschmidt
//
//  https://tosc.dev
//

import Foundation

struct CardStyle {
    let cardBacks = [
        CardBack(color: .red),
        CardBack(color: .green),
        CardBack(color: .blue)
    ]
}

struct CardBack {
    let color: CardBackColor
}

enum CardBackColor {
    case red
    case green
    case blue
}
