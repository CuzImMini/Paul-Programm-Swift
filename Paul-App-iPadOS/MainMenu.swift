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
        NavigationSplitView()
        {
            VStack {
                Divider()
                Spacer()
                VStack() {
                    Image(systemName: "graduationcap.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.accentColor)
                    Text("Paul-Programm!")
                        .font(.system(size: 24))
                        .foregroundColor(.primary)
                    Divider().frame(width: 200, height: 20)
                    Text("Bitte wähle ein Programm:")
                        .font(.system(size: 20))
                        .foregroundColor(.secondary)
                    Spacer().frame(width: 50, height: 50)
                    Text("Spiel-Auswahl")
                        .font(.system(size: 25))
                        .underline()
                }
                HStack() {
                    VStack() {
                        Spacer().frame(width: 20, height: 20)
                        NavigationLink(destination: TicTacToeGui()) {
                            Text("TicTacToe")
                                .font(.system(size: 20))
                        }
                        Spacer().frame(width: 20, height: 20)
                        NavigationLink(destination: Text("Vier gewinnt")) {
                            
                            Text("Vier gewinnt")
                                .font(.system(size: 20))
                            
                        }
                    }
                    Spacer().frame(width: 70, height: 10)
                    VStack() {
                        
                        Spacer().frame(width: 20, height: 20)
                        NavigationLink(destination: PaintMainGui()) {
                            Text("Paint")
                                .font(.system(size: 20))
                            
                        }
                        Spacer().frame(width: 20, height: 20)
                        NavigationLink(destination: PongMenu()) {
                            Text("Pong")
                                .font(.system(size: 20))
                        }
                    }
                }
                Spacer()
                
            }        } detail: {
                WelcomeView()
                
                
            }
        
        
        
    }
}

struct MainMenuiPadOS_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
