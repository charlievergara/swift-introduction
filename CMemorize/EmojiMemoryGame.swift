//
//  EmojiMemoryGame.swift
//  CMemorize
//
//  Created by Carlos Alberto Vergara Marrugo on 22/02/23.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🦺","👚","👔","👙","🩱","🧥","👖","👘","👗","🥻"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4){ pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //Intents
    func choose(_ card:MemoryGame<String>.Card){
        model.choose(card)
    }
                        
}
