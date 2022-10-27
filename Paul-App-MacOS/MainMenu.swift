//
//  ContentView.swift
//  PaulProgrammMacOS
//
//  Created by Paul Cornelissen on 05.10.22.
//

import SwiftUI

struct MainMenu: View {
    @Environment(\.openURL) var openURL

    var frameWidth: CGFloat = 650

    var body: some View {

        VStack() {
            Image(systemName: "graduationcap.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.accentColor)
            Text("Willkommen beim Paul-Programm!")
                    .font(.system(size: 24))
                    .foregroundColor(.primary)
                    .frame(width: frameWidth - 50, height: 50)
            Divider()
            Spacer(minLength: 40)
            HStack() {
                VStack() {
                    Text("Spiele")
                            .font(.system(size: 20))
                            .underline()
                    Button("TicTacToe") {
                        guard let url = URL(string: "paulcornelissen://tictactoe") else {
                            return
                        }
                        openURL(url)
                    }
                    Button("Pong") {
                        guard let url = URL(string: "paulcornelissen://pong") else {
                            return
                        }
                        openURL(url)
                    }
                }
                Spacer(minLength: 150)
                VStack() {
                    Text("Sonstiges")
                            .font(.system(size: 20))
                            .underline()
                    Button("Paint") {
                        guard let url = URL(string: "paulcornelissen://paulpaint") else {
                            return
                        }
                        openURL(url)
                    }
                    Button("Zahlen raten") {
                        guard let url = URL(string: "paulcornelissen://numberguess") else {
                            return
                        }
                        openURL(url)
                    }
                }
            }
        }
                .padding(150)
                .frame(width: frameWidth, height: 450)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
