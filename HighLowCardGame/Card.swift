//
//  HighLowCardGame
//  COPYRIGHT © 2020 Tobias Schaarschmidt
//
//  https://tosc.dev
//

import Foundation

struct Card {
    let suit: CardSuit
    let rank: CardRank
    var name: String {
        return "\(suit)_\(rank)"
    }
}

enum CardSuit: Int {
    case diamonds = 1
    case hearts
    case spades
    case clubs
}

enum CardRank: Int {
    case two = 1
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
}
