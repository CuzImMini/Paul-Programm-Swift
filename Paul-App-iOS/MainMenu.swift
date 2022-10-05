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
                    //Titel etc.
                    VStack() {
                        Image(systemName: "graduationcap.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.accentColor)
                            .navigationBarTitle("Hauptmenü", displayMode: .automatic)
                        Text("Paul-Programm!")
                            .font(.system(size: 24))
                            .foregroundColor(.primary)
                        Divider().frame(width: 300, height: 20)
                        Text("Bitte wähle ein Programm:")
                            .foregroundColor(.secondary)
                    }
                    Spacer().frame(width: 50, height: 50)
                    VStack() {
                        //Anordnung Knöpfe iPhone
                        if sizeClass == .compact {
                            Spacer().frame(width: 50, height: 50)
                            VStack(alignment: .center) {
                                Text("Spiele")
                                    .font(Font.system(size: 20))
                                    .underline()
                                    .bold()
                                Spacer().frame(width: 50, height: 20)
                                NavigationLink(destination: TicTacToeGui()) {
                                    Text("TicTacToe")
                                }
                                Spacer().frame(width: 50, height: 50)
                                Text("Spiele")
                                    .font(Font.system(size: 20))
                                    .underline()
                                    .bold()
                                Spacer().frame(width: 50, height: 20)
                                NavigationLink(destination: Text("coming soon")) {
                                    Text("coming soon")
                                }
                            }}
                        //Anordnung Knöpfe iPad
                        if sizeClass != .compact {
                            Spacer().frame(width: 50, height: 50)
                            HStack() {
                                VStack() {
                                    Text("Spiele")
                                        .font(.system(size: 20))
                                        .underline()
                                    Spacer().frame(width: 50, height: 20)
                                    NavigationLink(destination: Text("TicTacToe")) {
                                        Text("TicTacToe")
                                    }
                                }
                                Spacer().frame(width: 250, height: 20)
                                VStack() {
                                    Text("Sonstiges")
                                        .font(.system(size: 20))
                                        .underline()
                                    
                                    Spacer().frame(width: 50, height: 20)
                                    NavigationLink(destination: Text("coming soon")) {
                                        Text("coming soon")
                                    }
                                }
                            }
                            
                            
                            
                        }
                    }}
            }.navigationViewStyle(StackNavigationViewStyle())

        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
