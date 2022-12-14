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
            Divider()
                    .navigationTitle(engine.endGameText)
                    .navigationBarTitleDisplayMode(.large)

                    .frame(width: 100)
                    .alert(engine.endGameText, isPresented: $engine.gameEnded) {
                        Button("Reset", role: .destructive) {
                            engine.resetGame(scoreReset: false)
                        }
                    }
            Spacer()
            ZStack() {
                Rectangle()
                        .cornerRadius(15)
                        .frame(width: 500, height: 500)
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
                    .scaleEffect(1.2)

            Spacer()

        }
                .toolbar() {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Reset") {
                            engine.resetGame(scoreReset: false)
                        }
                                .buttonStyle(.bordered)
                                .padding(.horizontal, 20)
                                .padding(.top, 40)

                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        ScoreIndicator(score: $engine.score)
                                .onTapGesture {
                                    engine.resetGame(scoreReset: true)
                                }
                                .frame(minWidth: 200, minHeight: 170)
                                .padding(.top, 40)
                                .padding(.horizontal, -40)
                    }

                }

    }
}


struct TicTacToeView_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView() {
            TicTacToeGui()
        }
                .navigationViewStyle(StackNavigationViewStyle())

    }
}
