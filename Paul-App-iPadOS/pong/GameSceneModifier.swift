//
//  GameSceneModifier.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 16.10.22.
//

import Foundation

struct GameSceneModifierIpadOS {

    var portraitSize: CGSize = CGSize(width: 1224, height: 1224)
    var landscapeSize: CGSize = CGSize(width: 1224, height: 1224)

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
