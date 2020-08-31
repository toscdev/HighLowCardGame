//
//  HighLowCardGame
//  COPYRIGHT © 2020 Tobias Schaarschmidt
//
//  https://tosc.dev
//

import Foundation

class Game {
    private var _points = 0
    private var _opponentsCard: Card?
    private var _playersCard: Card?
    private var _userAnswerIsCorrect = false
    
    var cardDeck: [Card]?
    
    var points: Int {
        get { return _points }
    }
    
    var remainingCards: Int {
        get { return cardDeck!.count }
    }
    
    var opponentsCard: Card {
        get { return _opponentsCard! }
    }
    
    var playersCard: Card {
        get { return _playersCard! }
    }
    
    var userAnswerIsCorrect: Bool {
        get { return _userAnswerIsCorrect }
    }
    
    init() {
        cardDeck = CardDeck().cards
    }
    
    func startNewGame() {
        _points = 0
        cardDeck = CardDeck().cards
        self.cardDeck?.shuffle()
        dealCards()
    }
    
    func compareCards(hasHigherSelected: Bool) {
        guard let opponentsCard = _opponentsCard, let playersCard = _playersCard else {
            print("Error: Opponents card and/or players card is nil.")
            return
        }
        if hasHigherSelected && isPlayersCardHigher(opponentsCard: opponentsCard, playersCard: playersCard) {
            increasePoints()
            _userAnswerIsCorrect = true
            return
        }
        if !hasHigherSelected && !isPlayersCardHigher(opponentsCard: opponentsCard, playersCard: playersCard) {
            increasePoints()
            _userAnswerIsCorrect = true
            return
        }
        _userAnswerIsCorrect = false
    }
    
    func isPlayersCardHigher(opponentsCard: Card, playersCard: Card) -> Bool {
        // If the rank is even, compare suit
        if playersCard.rank.rawValue == opponentsCard.rank.rawValue {
            if playersCard.suit.rawValue > opponentsCard.suit.rawValue {
                return true
            } else {
                return false
            }
        }
        
        if playersCard.rank.rawValue > opponentsCard.rank.rawValue {
            return true
        }
        
        // Neither rank nor suit is higher
        return false
    }
    
    func dealCards() {
        guard let cardDeck = cardDeck else {
            print("Error: Card deck is nil.")
            return
        }
        _opponentsCard = cardDeck[0]
        _playersCard = cardDeck[1]
        removeDealtCards()
    }
    
    func removeDealtCards() {
        if cardDeck != nil {
            if cardDeck!.count >= 2 {
                cardDeck!.removeFirst(2)
            } else {
                gameOver()
            }
        }
    }
    
    func increasePoints() {
        _points += 1
    }
    
    func gameOver() {
        
    }
    
    let gameRules = """
    At the beginning of a new game the cards are shuffled.
    Two cards are dealt. One to the opponent and one to the player.
    The opponent's card is turned face up, the player's card is turned face down.
    The player must decide whether his card is higher or lower than the opponent's card.
    If the decision is correct the player receives one point.
    Now the next round begins. The opponent and the player receive another card from the deck.
    The game ends when all cards from the deck are dealt.

    The ranks of the cards:

    Rank (ascending):
    Two, Three, ..., Jack, Queen, King, Ace

    Suit (ascending):
    Diamonds, Hearts, Spades, Clubs

    Special case: If the opponent's card and the player's card are the same rank, the suit of the cards decides.
    """
}
