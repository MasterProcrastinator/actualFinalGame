//
//  Deck.swift
//  actualFinalGame
//
//  Created by ALVIN CHEN on 12/11/23.
//

import Foundation
//save????
enum Suit: CaseIterable{
    case spade
    case club
    case diamond
    case heart
    
 
    
}

enum CardValue: CaseIterable{
    case ace
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    var value: Int {
        switch self{
        case.ace:
            return 1
        case.two:
            return 2
        case.three:
            return 3
        case.four:
            return 4
        case.five:
            return 5
        case.six:
            return 6
        case.seven:
            return 7
        case.eight:
            return 8
        case.nine:
            return 9
        case.ten, .jack, .king, .queen:
            return 10
            
        }
        
    }
}

struct Card {
    let suit: Suit
    let worth: CardValue
    
    
}

func createDeck() -> [Card]{
    var deck: [Card] = []
    for s in Suit.allCases{
        for c in CardValue.allCases{
            deck.append(.init(suit: s, worth: c))
        }
    }
    return deck
}


func createImage(name theCard :Card) -> String{
    
    var string: String
    string = "\(theCard.suit)" + "\(theCard.worth)"
    
    return string
}

