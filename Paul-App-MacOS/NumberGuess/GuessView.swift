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
                Text("Gesucht ist eine Zahl zwischen 0 und 100:")
                    .font(.system(size: 30))
                    .underline().padding(.top, 80)
                Spacer().frame(maxHeight: 20)
                
            }
            VStack {
                HStack {
                    Spacer()
                    NumberView(state: $engine.state, big: true)
                        .onTapGesture {
                            engine.start()
                        }
                        .frame(width: 340, height: 160)
                    Spacer()
                    VStack {
                        Text("Versuche: \(engine.tries)")
                            .padding(10)
                        Button {
                            engine.reset()
                        } label: {
                            Text("Neustart")
                                .frame(maxWidth: 150)
                        }
                        .buttonStyle(.bordered)
                    }
                    Spacer()
                }
                .padding(.vertical, 35)
                Divider().padding(20)
                TextField(
                    "Zahl hier raten",
                    text: $engine.input
                )
                .keyboardShortcut(.tab)
                .textFieldStyle(.roundedBorder)
                .padding(.vertical, 10)
                .padding(.horizontal, 25)
            }
            Divider().padding(20)
            GuessButtons(engine: engine)
            Divider().padding(20)
            WinTable().frame(width: 250, height: 100)
            Divider().padding(20)
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
            
        }
    }
}

struct GuessView_Previews: PreviewProvider {
    static var previews: some View {
        
        GuessView()
        
    }
}
