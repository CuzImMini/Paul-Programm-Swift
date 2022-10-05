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
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ScrollView() {
        VStack() {
            //Titel
            if horizontalSizeClass == .compact {
                Text(engine.endGameText)
                    .underline()
                    .bold()
                    .foregroundColor(.accentColor)
                    .font(.system(size: 30))
                    .alert(engine.endGameText, isPresented: $engine.gameEnded) {
                        Button("Reset", role: .destructive, action: engine.resetGame)
                    }
            }
            else {
                Text(engine.endGameText)
                    .underline()
                    .bold()
                    .foregroundColor(.accentColor)
                    .font(.system(size: 40))
                    .alert(engine.endGameText, isPresented: $engine.gameEnded) {
                        Button("Reset", role: .destructive, action: engine.resetGame)
                    }
            }
            
            //Raster und Hintergrund
            if horizontalSizeClass == .compact {
                ZStack() {
                    Rectangle()
                        .cornerRadius(15)
                        .frame(width: 500, height: 500)
                        .padding(0)
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
            }
            else {
                Spacer(minLength: 200)
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
                        }}
                    
                }
            }
            
            if horizontalSizeClass == .compact {
                Button("Reset", action: engine.resetGame).font(.system(size: 20))
                
            }
            else  {
                Spacer(minLength: 200)
                Button("Reset", action: engine.resetGame).font(.system(size: 30))
            }
            
        }
        .padding(15)
        
        }
    }

    
}


struct TicTacToeView_Previews: PreviewProvider {

    static var previews: some View {
        TicTacToeGui()
        
    }
}
