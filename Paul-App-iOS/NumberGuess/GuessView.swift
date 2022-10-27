//
//  GuessView.swift
//  Paul-App-iOS
//
//  Created by Paul Cornelissen on 26.10.22.
//

import SwiftUI

struct GuessView: View {
    
    @ObservedObject var engine: Guessengine = Guessengine()
    
    var body: some View {
        VStack {
            Spacer().frame(maxHeight: 20)
                .navigationTitle("Pauls-Ratespiel")
            Text("Gesucht ist eine Zahl zwischen 0 und 100:").underline().padding(20)
            Spacer().frame(maxHeight: 20)

        }
        HStack {
            Spacer()
            NumberView(state: $engine.state, big: false)
                .onTapGesture {
                    engine.start()
                }
                .frame(minWidth: 160, minHeight: 80)
                
            Spacer()
            Button("Neustart") {
                engine.reset()
            }
            .buttonStyle(.bordered)
            Spacer()

        }
        Divider().frame(maxWidth: 340).padding(10)
        TextField(
            "Zahl hier raten",
            text: $engine.input
        )
        .keyboardType(.numberPad)
        .textFieldStyle(.roundedBorder)
        .padding(.vertical, 10)
        .padding(.horizontal, 25)
        Divider().frame(maxWidth: 340).padding(10)
        GuessButtons(engine: engine)
        Divider().frame(maxWidth: 340).padding(5)
        WinTable()
        Spacer()
            .alert("Du hast gewonnen!", isPresented: $engine.win) {
                Button("Reset", role: .destructive) {
                    engine.reset()
                }
            }
            .alert("Du hast verloren!", isPresented: $engine.loose) {
                Button("Reset", role: .destructive) {
                    engine.reset()
                }
            }
            .toolbar() {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("Versuche: \(engine.tries)")
                        .padding(10)
                        }
            }

    }
}

struct GuessView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            GuessView()}
    }
}
