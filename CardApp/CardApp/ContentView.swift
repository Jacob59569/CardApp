//
//  ContentView.swift
//  CardApp
//
//  Created by Jacob on 8/22/23.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🛟", "🛥️", "🛶", "🚤","🚜", "🚖", "⛽️", "⚓️","🚀", "🚆", "🚝", "🚠","🚧", "🏎️", "🗽", "🚚","🚉", "🏎️", "🚗", "🚑",]
    @State var emojiCount = 3
    var body: some View {
        VStack{
            HStack {
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                }
                
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .padding(3)
            }
            .padding()
            Spacer()
            HStack{
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
        }
        
        
            
    }
    var add: some View {
        Button(action: {
            if emojiCount < emojis.count { emojiCount += 1 } }, label: {Image(systemName: "plus.app")})
    }
    
    var remove: some View {
        Button(action: {
            if emojiCount > 1 { emojiCount -= 1 }}, label: {Image(systemName: "minus.square")})
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25)
            if isFaceUp {
                shape
                    .stroke(lineWidth: 10)
                shape
                    .fill(.white)
                
                Text(content)
                    .font(.largeTitle)
                    
            } else {
                shape
                    .fill()
                    
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
