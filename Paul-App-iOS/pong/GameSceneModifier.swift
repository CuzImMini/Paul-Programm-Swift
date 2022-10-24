//
//  GameSceneModifier.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 16.10.22.
//

import Foundation

struct GameSceneModifierIOS {
    
    var sceneVar: GameScene = GameScene()
        .setSizeSetting(CGSize(width: 585, height: 1100))
    
    func getScene() -> GameScene {
        return sceneVar
    }
    
    func getScene(type: GameTypes) -> GameScene {
        return sceneVar.setGameType(type)
    }
}
