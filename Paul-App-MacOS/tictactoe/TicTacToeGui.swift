//
//  TicTacToeView.swift
//  Paul-Programm-MacOS
//
//  Created by Paul Cornelissen on 01.10.22.
//

import SwiftUI

struct TicTacToeGui: View {
    
    let frameWidth: CGFloat = 600
    let frameHeight: CGFloat = 650
    
    @State public var spielzuege = ["", "", "", "", "", "", "", "", ""]
    @State private var endGameText = "TicTacToe!"
    @State public var gameEnded = false
    private var ranges = [(0..<3), (3..<6), (6..<9)]
    @State private var player: Int = 1
    
    
    var body: some View {
        
        VStack() {
            VStack() {
                //Titel
                
                Text(endGameText)
                    .font(.system(size: 30))
                    .underline()
                    .bold()
                    .foregroundColor(.accentColor)
                    .alert(endGameText, isPresented: $gameEnded) {
                        Button("Reset", role: .destructive, action: resetGame)
                    }
            }
            Spacer()
            //Raster und Hintergrund
            ZStack() {
                Rectangle()
                    .cornerRadius(25)
                    .frame(width: 500, height: 500)
                    .padding(0)
                    .foregroundColor(.accentColor)
                Image("tictactoebackground")
                    .resizable()
                    .frame(width: 450, height: 450)
                    .padding(10)
                    .background(.white)
                    .cornerRadius(15)
                VStack() {
                    ForEach(ranges, id: \.self) { range in
                        HStack {
                            ForEach(range, id: \.self) { i in
                                RasterFeld(imagePath: $spielzuege[i])
                                    .simultaneousGesture(
                                        TapGesture()
                                            .onEnded { _ in
                                                playerTap(index: i)
                                                
                                            }
                                    )
                            }
                        }
                    }
                    
                }
            }
            Spacer()
            Button("Reset",action: resetGame)
                .padding(.bottom, 20)
        }
        .frame(width: frameWidth, height: frameHeight)
        .padding(15)
    }
    
    func resetGame() {
        endGameText = "TicTacToe!"
        spielzuege = ["", "", "", "", "", "", "", "", ""]
        gameEnded = false
        player = 1
    }
    
    func playerTap(index: Int) {
        if spielzuege[index] == "" {
            spielzuege[index] = String(player)
            if player == 1 {
                player = 2
            } else {
                player = 1
            }
        }
        if checkWinner(moveDB: spielzuege, value: spielzuege[index]) {
            if spielzuege[index] == String(1) {
                endGameText = "Spieler Rot hat gewonnen!"
            } else {
                endGameText = "Spieler Blau hat gewonnen!"
            }
            gameEnded = true
        }
        if checkDraw(moveDB: spielzuege) {
            self.endGameText = "Kein Gewinner..."
            gameEnded = true
        }
        
        
    }
    
}


struct TicTacToeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        TicTacToeGui()
    }
}
