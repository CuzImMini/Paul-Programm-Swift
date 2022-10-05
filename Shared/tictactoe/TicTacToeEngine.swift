//
//  TicTacToeEngine.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 01.10.22.
//

import Foundation

class TicTacToeEngine: ObservableObject {
    
    @Published var spielzuege = ["", "", "", "", "", "", "", "", ""]
    @Published var endGameText = "TicTacToe!"
    @Published var gameEnded = false
    @Published var player: Int = Int.random(in: 1...2)
    
    let winReihen = [
        //Horizontale Reihen
        [0,1,2],[3,4,5,],[6,7,8],
        //Diagonale Reihen
        [0,4,8],[2,4,6],
        //Vertikale Reihen
        [0,3,6],[1,4,7],[2,5,8]
    ]
    
    func checkWinner() -> Bool {
        print("Test")
        for reihe in winReihen {
            var reihenlaenge = 0
            
            for feld in reihe {
                if spielzuege[feld] == String(player) {
                    reihenlaenge += 1
                    
                    
                    if reihenlaenge == 3 {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    func checkDraw() -> Bool {
        
        var belegteFelder = 0
        
        for string in spielzuege {
            if string != "" {
                belegteFelder += 1
                
                if belegteFelder == 9 {
                    return true
                }
            }
        }
        return false
    }
    
    func playerTap(index: Int) {
        if spielzuege[index] == "" {
            spielzuege[index] = String(player)
        }
        if checkWinner() {
            if spielzuege[index] == String(1) {
                endGameText = "Spieler Rot hat gewonnen!"
            } else {
                endGameText = "Spieler Blau hat gewonnen!"
            }
            gameEnded = true
        }
        if checkDraw() {
            endGameText = "Kein Gewinner..."
            gameEnded = true
        }
        
        if player == 1 {
            player = 2
        } else {
            player = 1
        }
        
        
    }
    
    func resetGame() {
        endGameText = "TicTacToe!"
        spielzuege = ["", "", "", "", "", "", "", "", ""]
        gameEnded = false
        player = Int.random(in: 1...2)
        
    }

    
}
