//
//  Paul_App_MacOSApp.swift
//  Paul-App-MacOS
//
//  Created by Paul Cornelissen on 05.10.22.
//

import SwiftUI

@main
struct Paul_App_MacOSApp: App {
    var body: some Scene {
        WindowGroup {
            MainMenu()
        }
        WindowGroup {
            TicTacToeGui()
        }
                .handlesExternalEvents(matching: ["tictactoe"])
        WindowGroup {
            PaintMainGui()
        }.handlesExternalEvents(matching: ["paulpaint"])
        WindowGroup{
            PongMenu()
        }.handlesExternalEvents(matching: ["pong"])
    }
}
