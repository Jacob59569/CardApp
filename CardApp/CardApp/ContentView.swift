//
//  ContentView.swift
//  CardApp
//
//  Created by Jacob on 8/22/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView(isFaceUp: false)
            CardView()
            CardView()
        }
        .padding(.horizontal)
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25)
            if isFaceUp {
                shape
                    .stroke(lineWidth: 10)
                shape
                    .fill(.white)
                
                Text("✈️")
                    .font(.largeTitle)
                    .padding()
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
