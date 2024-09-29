//
//  ContentView.swift
//  Memorize
//
//  Created by Manuel Santos Souza on 14/09/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "👽", "🕷️", "🎃", "🤖", "👾", "🤠", "🤡", "📱", "🐣", "😜", "😽"]

    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2 / 3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    @State private var isFaceUp = false
    let content: String

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)

            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2.0)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)

            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
