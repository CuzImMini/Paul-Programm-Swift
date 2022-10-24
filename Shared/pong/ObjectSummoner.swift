//
//  ObjectSummoner.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 15.10.22.
//

import SpriteKit

class ObjectSummoner {
    
    static func summonBall() -> SKSpriteNode {
        
        var ball: SKSpriteNode
        
        ball = SKSpriteNode(
            texture: SKTexture(imageNamed: "pongball"),

            size: CGSize(width: 35, height: 35)
            
        )
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 17.5)
        ball.physicsBody?.restitution = 0
        ball.physicsBody?.friction = 0
        ball.physicsBody?.affectedByGravity = false
        ball.physicsBody?.allowsRotation = false
        ball.physicsBody?.angularDamping = 0
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.angularVelocity = 0
        ball.physicsBody?.categoryBitMask = 2
        ball.physicsBody?.fieldBitMask = 0
        ball.physicsBody?.collisionBitMask = 1
        ball.physicsBody?.contactTestBitMask = 1
        ball.physicsBody?.isDynamic = true
        
        return ball
    }
    
    static func summonBouncepad(side: SideVariants, size: CGSize) -> SKSpriteNode {
        
        var bouncepad: SKSpriteNode
        
        bouncepad = SKSpriteNode(
            color: .white,
            size: size

        )
        
        bouncepad.physicsBody = SKPhysicsBody(rectangleOf: size)
        bouncepad.physicsBody?.restitution = 1
        bouncepad.physicsBody?.friction = 0
        bouncepad.physicsBody?.affectedByGravity = false
        bouncepad.physicsBody?.allowsRotation = false
        bouncepad.physicsBody?.categoryBitMask = 1
        bouncepad.physicsBody?.fieldBitMask = 0
        bouncepad.physicsBody?.collisionBitMask = 2
        bouncepad.physicsBody?.contactTestBitMask = 2
        bouncepad.physicsBody?.isDynamic = false
        
        
        return bouncepad
    }
    
    static func summonScoreLabel(side: SideVariants) -> SKLabelNode {
        
        var label: SKLabelNode
        
        label = SKLabelNode()
        label.text = String(0)
        label.fontSize = 120
        label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center

        
        if side == SideVariants.Left {
            label.zRotation = 3.14159
        }
        
        return label
    }
    
}


