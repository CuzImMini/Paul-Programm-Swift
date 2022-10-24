//
//  MainMenu.swift
//  Paul-App-iOS
//
//  Created by Paul Cornelissen on 16.10.22.
//

import SwiftUI


struct PongMenu: View {

    @State private var selectedMode: GameTypes = .singlePlayerEasy

    @State var pongView: PongStates = .OptionMenu


    var body: some View {
        switch pongView {

        case .OptionMenu:
            VStack {
                //Texte
                VStack {
                    Divider().frame(maxHeight: 10)

                    Text("Paul-Pong")
                            .foregroundColor(.white)
                            .font(.system(size: 45, weight: .black, design: .monospaced))

                    Spacer()

                    Text("Wähle einen Spielmodus:")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .black, design: .monospaced))

                    Spacer().frame(maxHeight: 35)
                }
                //Buttons
                VStack {
                    Picker("Spielmodus", selection: $selectedMode) {
                        ForEach(GameTypes.allCases, id: \.self) { gametype in
                            Text(gametype.rawValue)

                        }
                    }
                            .buttonStyle(.bordered)

                    Spacer()

                    Button("Spiel starten") {
                        switch selectedMode {

                        case .singlePlayerEasy:
                            pongView = .activeSinglePlayer1
                        case .singlePlayerMedium:
                            pongView = .activeSinglePlayer2
                        case .singlePlayerHard:
                            pongView = .activeSinglePlayer3
                        case .singlePlayerImpossible:
                            pongView = .aciveSinglePlayer4
                        case .multiPlayer:
                            pongView = .activeMultiPlayer
                        }
                    }
                            .buttonStyle(.bordered)
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                }
                Spacer()


            }
                    .navigationTitle("")
                    .navigationBarTitleDisplayMode(.inline)
                    .background(Color(red: 0.1, green: 0.1, blue: 0.1))
        case .activeSinglePlayer1:
            GameView(selectedGametype: .singlePlayerEasy)

        case .activeSinglePlayer2:
            GameView(selectedGametype: .singlePlayerMedium)

        case .activeSinglePlayer3:
            GameView(selectedGametype: .singlePlayerHard)

        case .aciveSinglePlayer4:
            GameView(selectedGametype: .singlePlayerImpossible)

        case .activeMultiPlayer:
            GameView(selectedGametype: .multiPlayer)

        }


    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {

        //NavigationView() {PongMenu()}
        MainMenu()

    }
}

enum PongStates: CaseIterable {

    case OptionMenu
    case activeSinglePlayer1
    case activeSinglePlayer2
    case activeSinglePlayer3
    case aciveSinglePlayer4
    case activeMultiPlayer

}

