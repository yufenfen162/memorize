//
//  ThemePool.swift
//  memorize
//
//  Created by 11344216 on 2026/4/27.
//
import Foundation

struct ThemePool <ItemContent>{
    private(set) var themes: [Theme] = []
    mutating func addTheme(name: String, color: String, numberOfPairs: Int, items: [ItemContent]) {
        let newTheme = Theme(name: name, color: color, numberOfPairs: numberOfPairs, items: items)
        themes.append(newTheme)
    }
    
    struct Theme {
        var name: String
        var color: String
        var numberOfPairs: Int
        var items: [ItemContent]
    }
}
