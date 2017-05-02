//
//  Hand.swift
//  面向协议编程思想组合
//
//  Created by 陈良静 on 2017/4/21.
//  Copyright © 2017年 陈良静. All rights reserved.
//

import Foundation

struct Deck {
    fileprivate func nextCard() -> Card {
        let card = Card()
        
        return card
    }
}

struct Card {
    
}

class Hand {
    
    fileprivate let deck = Deck()
    fileprivate var cards = [Card]()
    
    var numberOfCards : Int {
        return cards.count
    }
    
    func cardAtPosition(index: Int) -> Card {
        return cards[index]
    }
    
    func addNewCardsAtIndex(index: Int) {
        insertCard(card: deck.nextCard(), atIndex: index)
    }
    
    fileprivate func insertCard(card: Card, atIndex index: Int) {
        cards.insert(card, at: index)
    }
    
    func deleteCardAtIndex(index: Int) {
        cards.remove(at: index)
    }
    
    func moveCard(fromIndex: Int, toIndex: Int) {
        let cardToMove = cards[fromIndex]
        deleteCardAtIndex(index: fromIndex)
        insertCard(card: cardToMove, atIndex: toIndex)
    }
    
}

