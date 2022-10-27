//
//  Enum.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 26.10.22.
//

import Foundation

enum NumberStates: String, CaseIterable {
    
case inGame = "Los gehts!"
case none = "Zahl generieren"
case farAway = "eiskalt!"
case near = "wärmer!"
case veryNear = "ziemlich warm!"
case close = "sehr heiß!"
case guessed = "erraten!"
    
}
