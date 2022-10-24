//
//  TicTacToeView.swift
//  Paul-Programm-MacOS
//
//  Created by Paul Cornelissen on 01.10.22.
//

import SwiftUI

struct TicTacToeGui: View {

    let frameWidth: CGFloat = 600
    let frameHeight: CGFloat = 700

    let ranges = [(0..<3), (3..<6), (6..<9)]

    @ObservedObject var engine: TicTacToeEngine = TicTacToeEngine()

    var body: some View {

        VStack() {
            HStack() {
                //Titel
                Spacer()
                Text(engine.endGameText)
                        .font(.system(size: 30))
                        .underline()
                        .bold()
                        .foregroundColor(.accentColor)
                        .alert(engine.endGameText, isPresented: $engine.gameEnded) {
                            Button("Reset", role: .destructive) {
                                engine.resetGame(scoreReset: false)
                            }
                        }
                Spacer()
                Divider().frame(maxHeight: 100)
                Spacer()
                ScoreIndicator(score: $engine.score)
                Spacer().frame(maxWidth: 50)
            }
            Spacer(minLength: 20)
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
            }
            Spacer(minLength: 20)

            HStack {
                Button("Neustart") {
                    engine.resetGame(scoreReset: true)
                }
                Spacer().frame(maxWidth: 100)
                        .padding(20)
                Button("Reset") {
                    engine.resetGame(scoreReset: false)
                }
                        .padding(20)
            }
        }
                .frame(width: frameWidth, height: frameHeight)
                .padding(15)
    }


}


struct TicTacToeView_Previews: PreviewProvider {

    static var previews: some View {
        TicTacToeGui()
    }
}
