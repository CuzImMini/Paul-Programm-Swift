//
//  TicTacToeEngine.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 01.10.22.
//

import Foundation

class TicTacToeEngine: ObservableObject {

    @Published var spielzuege = ["0", "0", "0", "0", "0", "0", "0", "0", "0"]
    @Published var endGameText = "TicTacToe!"
    @Published var gameEnded = false
    @Published var player: Int = 1

    @Published var score = [0, 0]


    let winReihen = [
        //Horizontale Reihen
        [0, 1, 2], [3, 4, 5, ], [6, 7, 8],
        //Diagonale Reihen
        [0, 4, 8], [2, 4, 6],
        //Vertikale Reihen
        [0, 3, 6], [1, 4, 7], [2, 5, 8]
    ]

    func checkWinner() -> Bool {
        for reihe in winReihen {
            var reihenlaenge = 0

            for feld in reihe {
                if spielzuege[feld] == String(player) {
                    reihenlaenge += 1


                    if reihenlaenge == 3 {
                        if player == 1 {
                            score[0] += 1
                        } else {
                            score[1] += 1
                        }
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
            if string != String(0) {
                belegteFelder += 1

                if belegteFelder == 9 {
                    return true
                }
            }
        }
        return false
    }

    func playerTap(index: Int) {
        if spielzuege[index] == String(0) {
            spielzuege[index] = String(player)
        }
        if checkWinner() {
            if spielzuege[index] == String(1) {
                endGameText = "Sieg für Rot!"
            } else {
                endGameText = "Sieg für Blau!"
            }
            gameEnded = true
        }
        if checkDraw() {
            endGameText = "Kein Gewinner"
            gameEnded = true
        }

        if player == 1 {
            player = 2
        } else {
            player = 1
        }


    }

    func resetGame(scoreReset: Bool) {
        endGameText = "TicTacToe!"
        spielzuege = ["0", "0", "0", "0", "0", "0", "0", "0", "0"]
        gameEnded = false
        player = Int.random(in: 1...2)
        if scoreReset {
            score = [0, 0]

        }

    }


}
