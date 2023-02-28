//
//  MemoryGame.swift
//  CMemorize
//
//  Created by Carlos Alberto Vergara Marrugo on 22/02/23.
//

import Foundation

struct MemoryGame<CardContent>{
    private(set) var cards:Array<Card>
    
    init(numberOfPairsOfCards:Int, createCardContent:(Int)->CardContent){
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content:CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content,id: pairIndex*2))
            cards.append(Card(content: content,id: pairIndex*2+1))
        }
    }
    
    mutating func choose(_ card:Card){
        let  index = index(of: card)
        
        cards[index].isFaceUp.toggle()
        
        print("chosenCard = \(cards[index])")
    }
    
    func index(of card: Card)-> Int {
        for index in 0..<cards.count{
            if cards[index].id == card.id {
                return index
            }
        }
        
        return 0
    }
    
    struct Card:Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
