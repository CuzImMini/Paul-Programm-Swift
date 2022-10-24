//
//  EventListener.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 15.10.22.
//

import Foundation
import SpriteKit

class EventListener {
    
    init(rightBouncepad: SKSpriteNode, leftBouncepad: SKSpriteNode, ball: SKSpriteNode, scene: GameScene) {
        self.bouncepadR = rightBouncepad
        self.bouncepadL = leftBouncepad
        self.ball = ball
        self.scene = scene
    }

    var scene: GameScene
    var ball: SKSpriteNode
    var bouncepadR: SKSpriteNode
    var bouncepadL: SKSpriteNode
    
    func checkEvent() -> GameEvent {
        
        if ball.position.y >= (scene.frame.height/2) - 22.5 {
            return GameEvent.goalAtL
        }
        if ball.position.y <= -(scene.frame.height/2) + 22.5 {
            return GameEvent.goalAtR
        }
        
            return GameEvent.nothing
    }
    
    
}

