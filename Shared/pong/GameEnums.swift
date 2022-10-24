//
//  GameEvents.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 15.10.22.
//

import Foundation

enum GameEvent: CaseIterable {
    case nothing
    case goalAtR
    case goalAtL
}

enum SideVariants: CaseIterable {
    case Left
    case Right
}

enum GameTypes: String, CaseIterable, Hashable {
    
    case singlePlayerEasy = "Einzelspieler-Einfach"
    case singlePlayerMedium = "Einzelspieler-Mittel"
    case singlePlayerHard = "Einzelspieler-Schwer"
    case singlePlayerImpossible = "Einzelspieler-Unmöglich"
    case multiPlayer = "2-Spieler"
    
}

enum Orientation: CaseIterable {
    case Portrait
    case Landscape
}
