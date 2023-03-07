//
//  MemoryGame.swift
//  CMemorize
//
//  Created by Carlos Alberto Vergara Marrugo on 22/02/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent:Equatable {
    private(set) var cards:Array<Card>
    private var indexOfCardSelected: Int?
    
    init(numberOfPairsOfCards:Int, createCardContent:(Int)->CardContent){
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content:CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content,id: pairIndex*2))
            cards.append(Card(content: content,id: pairIndex*2+1))
        }
    }
    
    mutating func choose(_ card:Card){
        //if let  index = index(of: card) {
        if let  index = cards.firstIndex(where: {$0.id == card.id}),
            !cards[index].isFaceUp,
            !cards[index].isMatched   { 
            
            if let potencialMatchIndex = indexOfCardSelected {
                if cards[index].content == cards[potencialMatchIndex].content {
                    cards[index].isMatched = true
                    cards[potencialMatchIndex].isMatched = true
                }
                indexOfCardSelected = nil
            }else{
                for cardIndex in cards.indices{
                    cards[cardIndex].isFaceUp = false
                }
                indexOfCardSelected = index
                
            }
            cards[index].isFaceUp.toggle()
            
            print("chosenCard = \(cards[index])")
        }
    }
    
    struct Card:Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
