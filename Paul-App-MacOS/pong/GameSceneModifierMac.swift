//
//  GameSceneModifier.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 16.10.22.
//

import Foundation

struct GameSceneModifierMac {

    var portraitSize: CGSize = CGSize(width: 1920, height: 1080)
    var landscapeSize: CGSize = CGSize(width: 1920, height: 1080)

    var sceneVar: GameScene = GameScene()

    func getScene(orientation: Orientation, type: GameTypes) -> GameScene {
        if orientation == .Landscape {
            return sceneVar.setSizeSetting(landscapeSize).setGameType(type)
        } else {
            return sceneVar.setSizeSetting(portraitSize).setGameType(type)

        }
    }

    func getScene() -> GameScene {
        return sceneVar
    }

}
