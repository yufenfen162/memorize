//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by 11344216 on 2026/3/30.
//

import Foundation

@Observable

class EmojiMemoryGame {
    private static var emojis = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    private static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: 4, createCardContent: {index in EmojiMemoryGame.emojis[index]})
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards:[MemoryGame<String>.Card]{
        model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    func shuffle(){
        model.shuffle()
    }
}
