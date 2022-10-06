//
//  ContentView.swift
//  PaulProgramm
//
//  Created by Paul Cornelissen on 02.10.22.
//

import SwiftUI

struct MainMenu: View {
    @Environment(\.horizontalSizeClass) var sizeClass

    var body: some View {
        NavigationView() {
            VStack {
                Spacer()
                VStack() {
                    Image(systemName: "graduationcap.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.accentColor)
                            .navigationBarTitle("Hauptmenü", displayMode: .automatic)
                    Text("Paul-Programm!")
                            .font(.system(size: 24))
                            .foregroundColor(.primary)
                    Divider().frame(width: 200, height: 20)
                    Text("Bitte wähle ein Programm:")
                            .foregroundColor(.secondary)
                    Spacer().frame(width: 50, height: 50)
                }
                HStack() {
                    VStack() {
                        Text("Spiele")
                                .font(.system(size: 20))
                                .underline()
                        Spacer().frame(width: 20, height: 20)
                        NavigationLink(destination: TicTacToeGui()) {
                            Text("TicTacToe")
                        }
                    }
                    Spacer().frame(width: 50, height: 10)
                    VStack() {
                        Text("Sonstiges")
                                .font(.system(size: 20))
                                .underline()

                        Spacer().frame(width: 20, height: 20)
                        NavigationLink(destination: PaintMainGui()) {
                            Text("Paint")
                        }
                    }
                }
                Spacer()

            }
            
            VStack() {
                Image(systemName: "graduationcap.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.accentColor)
                        .navigationBarTitle("Hauptmenü", displayMode: .automatic)
                Spacer().frame(width: 10, height: 40)
                Text("Willkommen beim Paul-Programm!")
                        .font(.system(size: 44))
                        .foregroundColor(.primary)
                        .navigationTitle("Hauptmenü")
            }        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
