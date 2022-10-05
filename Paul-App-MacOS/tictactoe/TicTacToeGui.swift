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

    let ranges = [(0..<3), (3..<6), (6..<9)]

    @ObservedObject var engine: TicTacToeEngine = TicTacToeEngine()

    var body: some View {

        VStack() {
            VStack() {
                //Titel
                Text(engine.endGameText)
                        .font(.system(size: 30))
                        .underline()
                        .bold()
                        .foregroundColor(.accentColor)
                        .alert(engine.endGameText, isPresented: $engine.gameEnded) {
                            Button("Reset", role: .destructive, action: engine.resetGame)
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
            Spacer()
            Button("Reset") {
                engine.resetGame()
            }
                    .padding(.bottom, 20)
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
