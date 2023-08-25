//
//  ContentView.swift
//  CardApp
//
//  Created by Jacob on 8/22/23.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🛟", "🛥️", "🛶", "🚤","🚜", "🚖", "⛽️", "⚓️","🚀", "🚆", "🚝", "🚠","🚧", "🏎️", "🗽", "🚚","🚉", "🛺", "🚗", "🚑", "🛵", "🏍️", "🚲", "🚛"]
    @State var emojiCount = 24
    var body: some View {
        VStack {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3 , contentMode: .fit)
                    }
                    
                    .foregroundColor(.red)
                    .padding(3)
                }
                .padding()
            }
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
                    .fill(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                
                
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
