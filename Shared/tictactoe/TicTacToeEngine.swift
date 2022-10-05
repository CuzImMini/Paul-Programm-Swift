//
//  TicTacToeEngine.swift
//  Paul-Programm-MacOS
//
//  Created by Paul Cornelissen on 01.10.22.
//

import Foundation

class TicTacToeEngine {
    
    @Published public var spielzuege = ["", "", "", "", "", "", "", "", ""]
    @Published private var endGameText = "TicTacToe!"
    @Published public var gameEnded = false
    @Published private var player: Int = Int.random(in: 1..<3)
    
    private var ranges = [(0..<3), (3..<6), (6..<9)]

    
    func checkWinner(moveDB: [String], value: String) -> Bool {
        let winReihen = [
            //Horizontale Reihen
            [0, 1, 2, ], [3, 4, 5], [6, 7, 8],
            //Diagonale Reihen
            [0, 4, 8], [2, 4, 6],
            //Vertikale Reihen
            [0, 3, 6, ], [1, 4, 7], [2, 5, 8]
        ]
        
        for reihe in winReihen {
            var reihenlaenge = 0
            
            for feld in reihe {
                if moveDB[feld] == value {
                    reihenlaenge += 1
                    
                    if reihenlaenge == 3 {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    func checkDraw(moveDB: [String]) -> Bool {
        
        var belegteFelder = 0
        
        for string in moveDB {
            if string != "" {
                belegteFelder += 1
                
                if belegteFelder == 9 {
                    return true
                }
            }
        }
        return false
    }
    
}

