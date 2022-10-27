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
            VStack {
                Spacer().frame(maxHeight: 20)
                    .navigationTitle("Pauls-Ratespiel")
                Text("Gesucht ist eine Zahl zwischen 0 und 100:")
                    .font(.system(size: 30))
                    .underline().padding(20)
                Spacer().frame(maxHeight: 20)
                
            }
            VStack {
                HStack {
                    Spacer()
                    NumberView(state: $engine.state, big: true)
                        .onTapGesture {
                            engine.start()
                        }

                    
                    Spacer()
                        
                    Button("Neustart") {
                        engine.reset()
                    }
                    .font(.system(size: 35))
                    .buttonStyle(.bordered)
                    Spacer()
                }
                .padding(50)
                Divider().padding(20)
                TextField(
                    "Zahl hier raten",
                    text: $engine.input
                )
                .keyboardType(.numberPad)
            
            .textFieldStyle(.roundedBorder)
            .padding(.vertical, 10)
            .padding(.horizontal, 25)
            }
            Divider().padding(20)
            GuessButtons(engine: engine)
            Spacer()
            WinTable().padding(50)
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
}

struct GuessView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            GuessView()
            
        }
    }
}
