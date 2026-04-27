//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by 11344216 on 2026/3/30.
//

import Foundation
import SwiftUI

@Observable

class EmojiMemoryGame {
    private var themePool: ThemePool<String>
    private var currentTheme: ThemePool<String>.Theme
    private var model: MemoryGame<String>
    
    init(){
        var pool = ThemePool<String>()
        
        pool.addTheme(name:"英文字母", color:"orange", numberOfPairs: 6, items: ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"])
        pool.addTheme(name:"生肖", color:"green", numberOfPairs: 6, items: ["鼠","牛","虎","兔","龍","蛇","馬","羊","猴","雞","狗","豬"])
        pool.addTheme(name:"等級", color:"blue", numberOfPairs: 6, items: ["甲","乙","丙","丁","戊","己","庚","辛","壬","癸"])
        
        self.themePool = pool
        let randomTheme = pool.themes.randomElement()!
        self.currentTheme = randomTheme
        self.model = EmojiMemoryGame.createMemoryGame(theme:randomTheme)
    }
    
    private static func createMemoryGame(theme: ThemePool<String>.Theme) -> MemoryGame<String>{
        let shuffledItems = theme.items.shuffled()
        let pairsToPlay = min(theme.numberOfPairs, shuffledItems.count)
        return MemoryGame<String>(numberOfPairsOfCards: pairsToPlay){
            index in
            if index < shuffledItems.count{
                return shuffledItems[index]
            }else{
                return "?"
            }
        }
    }
    
    var cards:[MemoryGame<String>.Card]{
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    var themeName: String {
        currentTheme.name
    }
    
    var themeColor: Color {
        switch currentTheme.color {
        case "orange": return .orange
        case "green": return .green
        case "blue": return .blue
        default: return .red
        }
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    func shuffle(){
        model.shuffle()
    }
    
    func newGame(){
        currentTheme = themePool.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme:currentTheme)
    }
}
