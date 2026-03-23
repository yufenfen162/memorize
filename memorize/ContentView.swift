//
//  ContentView.swift
//  memorize
//
//  Created by 11344216 on 2026/3/16.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O"]
    
    @State var emojiCount = 6
    
    var body: some View {
        VStack{
            HStack{
                ForEach(emojis[0..<emojiCount], id: \.self) {emojis in
                    CardView(content: emojis)
                }
            }
            HStack{
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
        }
        .padding()
        .foregroundStyle(.orange)
    }
    var remove: some View{
        Button {
            if emojiCount > 1{
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View{
        Button {
            if emojiCount < emojis.count{
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                
                Text(content).font(.largeTitle)
            }
            else {
                RoundedRectangle(cornerRadius: 20)
            }
        }
        .onTapGesture{
            isFaceUp = !isFaceUp
        }
    }
}

#Preview {
    ContentView()
}
