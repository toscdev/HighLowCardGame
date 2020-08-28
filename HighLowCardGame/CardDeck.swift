//
//  HighLowCardGame
//  COPYRIGHT © 2020 Tobias Schaarschmidt
//
//  https://tosc.dev
//

import Foundation

struct CardDeck {
    let cards = [
        // Diamonds
        Card(suit: .diamonds, rank: .two),
        Card(suit: .diamonds, rank: .three),
        Card(suit: .diamonds, rank: .four),
        Card(suit: .diamonds, rank: .five),
        Card(suit: .diamonds, rank: .six),
        Card(suit: .diamonds, rank: .seven),
        Card(suit: .diamonds, rank: .eight),
        Card(suit: .diamonds, rank: .nine),
        Card(suit: .diamonds, rank: .ten),
        Card(suit: .diamonds, rank: .jack),
        Card(suit: .diamonds, rank: .queen),
        Card(suit: .diamonds, rank: .king),
        Card(suit: .diamonds, rank: .ace),
        
        // Hearts
        Card(suit: .hearts, rank: .two),
        Card(suit: .hearts, rank: .three),
        Card(suit: .hearts, rank: .four),
        Card(suit: .hearts, rank: .five),
        Card(suit: .hearts, rank: .six),
        Card(suit: .hearts, rank: .seven),
        Card(suit: .hearts, rank: .eight),
        Card(suit: .hearts, rank: .nine),
        Card(suit: .hearts, rank: .ten),
        Card(suit: .hearts, rank: .jack),
        Card(suit: .hearts, rank: .queen),
        Card(suit: .hearts, rank: .king),
        Card(suit: .hearts, rank: .ace),
        
        // Spades
        Card(suit: .spades, rank: .two),
        Card(suit: .spades, rank: .three),
        Card(suit: .spades, rank: .four),
        Card(suit: .spades, rank: .five),
        Card(suit: .spades, rank: .six),
        Card(suit: .spades, rank: .seven),
        Card(suit: .spades, rank: .eight),
        Card(suit: .spades, rank: .nine),
        Card(suit: .spades, rank: .ten),
        Card(suit: .spades, rank: .jack),
        Card(suit: .spades, rank: .queen),
        Card(suit: .spades, rank: .king),
        Card(suit: .spades, rank: .ace),
        
        // Clubs
        Card(suit: .clubs, rank: .two),
        Card(suit: .clubs, rank: .three),
        Card(suit: .clubs, rank: .four),
        Card(suit: .clubs, rank: .five),
        Card(suit: .clubs, rank: .six),
        Card(suit: .clubs, rank: .seven),
        Card(suit: .clubs, rank: .eight),
        Card(suit: .clubs, rank: .nine),
        Card(suit: .clubs, rank: .ten),
        Card(suit: .clubs, rank: .jack),
        Card(suit: .clubs, rank: .queen),
        Card(suit: .clubs, rank: .king),
        Card(suit: .clubs, rank: .ace),
    ]
}
