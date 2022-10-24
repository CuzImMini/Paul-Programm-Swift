//
//  TicTacToeView.swift
//  Paul-Programm-MacOS
//
//  Created by Paul Cornelissen on 01.10.22.
//

import SwiftUI

struct TicTacToeGui: View {
    
    let ranges = [(0..<3), (3..<6), (6..<9)]
    
    
    @ObservedObject var engine = TicTacToeEngine()
    
    var body: some View {
        VStack() {
            Spacer()
            ScoreIndicator(score: $engine.score)
                .alert(engine.endGameText, isPresented: $engine.gameEnded) {
                    Button("Reset", role: .destructive) {engine.resetGame(scoreReset: false)
                    }
                }

                .navigationTitle(engine.endGameText)
            ZStack() {
                Rectangle()
                    .cornerRadius(15)
                    .frame(width: 500, height: 500)
                    .foregroundColor(.accentColor)
                    .scaleEffect(0.7)
                Image("tictactoebackground")
                    .resizable()
                    .frame(width: 450, height: 450)
                    .padding(10)
                    .background(.white)
                    .cornerRadius(15)
                    .scaleEffect(0.7)
                
                VStack() {
                    ForEach(ranges, id: \.self) { range in
                        HStack {
                            ForEach(range, id: \.self) { i in
                                RasterFeld(imagePath: $engine.spielzuege[i])
                                    .simultaneousGesture(
                                        TapGesture()
                                            .onEnded { _ in
                                                engine.playerTap(index: i)
                                                
                                            }
                                    )
                            }
                        }
                    }
                }
                .scaleEffect(0.7)
            }
            Spacer()
            
        }
        .toolbar() {
            ToolbarItem(placement: .automatic) {
                Button("Neustart") {engine.resetGame(scoreReset: true)}
                    .buttonStyle(.bordered)

            }
            
        }
    
        
    }
    
    
}


struct TicTacToeView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView() {
            TicTacToeGui()
        }
        
    }
}
