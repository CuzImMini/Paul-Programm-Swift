//
//  GuessButtons.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 26.10.22.
//

import SwiftUI

struct GuessButtons: View {
    
    @ObservedObject var engine: Guessengine
    
    var body: some View {
        HStack(spacing: 20) {
            Button("-10") {
                engine.giveModifyTyp(modifier: -10)
            }
            Button("-1") {
                engine.giveModifyTyp(modifier: -1)
            }
            
            Button("Tippen") {
                engine.giveTip()
            }
            .keyboardShortcut(.defaultAction)
            Button("+1") {
                engine.giveModifyTyp(modifier: 1)
            }
            Button("+10") {
                engine.giveModifyTyp(modifier: 10)
            }
        }
        .buttonStyle(.bordered)
    }
}

struct GuessButtons_Previews: PreviewProvider {
    static var previews: some View {
        GuessButtons(engine: Guessengine())
    }
}
