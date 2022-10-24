//
//  GameScene.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 15.10.22.
//

import SpriteKit
import SwiftUI

class GameScene: SKScene {
    
    private var ball: SKSpriteNode?
    private var bouncepadR: SKSpriteNode?
    private var bouncepadL: SKSpriteNode?
    private var scoreLabelR: SKLabelNode = ObjectSummoner.summonScoreLabel(side: .Right)
    private var scoreLabelL: SKLabelNode = ObjectSummoner.summonScoreLabel(side: .Left)
    
    private var backButton: SKLabelNode!
    private var resetButton: SKLabelNode!
    
    
    private var score: [Int] = [0,0]
    private var gameActive: Bool = false
    private var eventListener: EventListener?
    
    var sizeSetting: CGSize?
    var gametype: GameTypes?
    var firstMove: Bool = true
    
    var enemyDelay: Double?
    
    
    
    override func didMove(to view: SKView) {
        
#if os(iOS)
        self.view?.isMultipleTouchEnabled = true
#endif
        
        if firstMove {
            
            //Größe
            self.size = sizeSetting ?? CGSize(width: 1, height: 1)
            //Hintergrund
            backgroundColor = NSColor(Color(red: 0.1, green: 0.1, blue: 0.1))
            
            //Score
            scoreLabelL.position = CGPoint(x: 0, y: (self.frame.height/6))
            addChild(scoreLabelL)
            
            scoreLabelR.position = CGPoint(x: 0, y: -(self.frame.height/6))
            addChild(scoreLabelR)
            
            //Ball
            ball = ObjectSummoner.summonBall()
            addChild(ball!)
            
            //Bouncepad-R
            bouncepadR = ObjectSummoner.summonBouncepad(side: .Right, size: CGSize(width: self.frame.width/4, height: 20))
            bouncepadR!.position.y = (-self.frame.height/2 + 30)
            addChild(bouncepadR!)
            
            //Bouncepad-L
            bouncepadL = ObjectSummoner.summonBouncepad(side: .Left, size: CGSize(width: self.frame.width/4, height: 20))
            bouncepadL!.position.y = (self.frame.height/2 - 30)
            addChild(bouncepadL!)
            
            //Einstellungen Szene
            self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            
            //Event-Listener
            eventListener = EventListener(rightBouncepad: bouncepadR!, leftBouncepad: bouncepadL!, ball: ball!, scene: self)
            
            //Rand
            let border = SKPhysicsBody(edgeLoopFrom: frame)
            border.restitution = 1
            border.friction = 0
            self.physicsBody = border
            
            firstMove = false
            
        }
        
        switch gametype {
            
        case .singlePlayerEasy:
            enemyDelay = 0.45
        case .singlePlayerMedium:
            enemyDelay = 0.35
        case .singlePlayerHard:
            enemyDelay = 0.25
        case .singlePlayerImpossible:
            enemyDelay = 0.15
        case .none:
            return
        case .some(.multiPlayer):
            return
        }
        
    }
    
#if os(iOS)
    //Berührungen auf Bouncepads casten
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !gameActive {
            for touch in touches {
                if touch.location(in: self).y < 200 && touch.location(in: self).y > -200 {
                    
                    gameActive = true
                    startGame()
                    
                    return
                }
            }
        }
        touchCrawler(touches)
    }
    
    //Bewegung auf Bouncepads casten
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        touchCrawler(touches)
    }
    //Bewegung Bouncepads
    private func touchCrawler(_ touches: Set<UITouch>) {
        switch gametype {
            
        case .singlePlayerEasy:
            for touch in touches {
                let location = touch.location(in: self)
                
                if location.y < -100 {
                    bouncepadR!.run(SKAction.moveTo(x: location.x, duration: 0.1))
                }
            }
        case .singlePlayerMedium:
            for touch in touches {
                let location = touch.location(in: self)
                
                if location.y < -100 {
                    bouncepadR!.run(SKAction.moveTo(x: location.x, duration: 0.1))
                }
            }
        case .singlePlayerHard:
            for touch in touches {
                let location = touch.location(in: self)
                
                if location.y < -100 {
                    bouncepadR!.run(SKAction.moveTo(x: location.x, duration: 0.1))
                }
            }
        case .singlePlayerImpossible:
            for touch in touches {
                let location = touch.location(in: self)
                
                if location.y < -100 {
                    bouncepadR!.run(SKAction.moveTo(x: location.x, duration: 0.1))
                }
            }
        case .multiPlayer:
            for touch in touches {
                let location = touch.location(in: self)
                
                if location.y > 100 {
                    bouncepadL!.run(SKAction.moveTo(x: location.x, duration: 0.1))
                }
                if location.y < -100 {
                    bouncepadR!.run(SKAction.moveTo(x: location.x, duration: 0.1))
                }
            }
        case .none:
            return
        }
        
        
    }
#endif
    
#if os(macOS)
   
    override func keyDown(with event: NSEvent) {
        if !gameActive {
                
                if event.characters == "g"  {
                    
                    gameActive = true
                    startGame()
                    
                    return
                }
            
        }
        if event.characters == "r" {self.reset()}
        keyCrawler(event.characters ?? "0")
    }
    
        //Bewegung Bouncepads
    private func keyCrawler(_ key: String) {
            switch gametype {
                
            case .singlePlayerEasy, .singlePlayerMedium, .singlePlayerHard, .singlePlayerImpossible:
                    if key == "i" {
                        bouncepadR!.run(SKAction.moveTo(x: bouncepadR!.position.x + 150, duration: 0.1))
                    }
                    if key == "k" {
                        bouncepadR!.run(SKAction.moveTo(x: bouncepadR!.position.x - 150, duration: 0.1))
                    }
                
            case .multiPlayer:
                    
                    if key == "i" {
                        bouncepadR!.run(SKAction.moveTo(x: bouncepadR!.position.x + 150, duration: 0.1))
                    }
                    if key == "k" {
                        bouncepadR!.run(SKAction.moveTo(x: bouncepadR!.position.x - 150, duration: 0.1))
                    }
                    if key == "e" {
                        bouncepadL!.run(SKAction.moveTo(x: bouncepadL!.position.x + 150, duration: 0.1))
                    }
                    if key == "d" {
                        bouncepadL!.run(SKAction.moveTo(x: bouncepadL!.position.x - 150, duration: 0.1))
                    }
                
            case .none:
                return
            }
            

        }
    
    
    #endif
    
    //Auf Events prüfen
    override func update(_ currentTime: TimeInterval) {
        if eventListener?.checkEvent() == GameEvent.goalAtR {
            print("Goal at R")
            score[0] += 1
            reset()
        }
        else if eventListener?.checkEvent() == GameEvent.goalAtL {
            print("Goal at L")
            score[1] += 1
            reset()
        }
        
        if gametype != .multiPlayer {

            bouncepadL!.run(SKAction.moveTo(x: ball!.position.x, duration: enemyDelay!))
        }
        
    }
    
    //Spiel starten
    func startGame() {
        //Ball bewegen
        ball!.physicsBody?.applyImpulse(getStartVector())
        
    }
    
    //Spiel anhalten
    func reset() {
        gameActive = false
        
        //Ball anhalten
        ball!.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        ball!.position = CGPoint(x: 0, y: 0)
        
        //Score setzen
        scoreLabelL.text = String(score[1])
        scoreLabelR.text = String(score[0])
    }
    
    //Spiel anhalten und Spielstand zurücksetzen
    func fullReset() {
        score = [0,0]
        self.reset()
        bouncepadL!.position.x = 0
        bouncepadR!.position.x = 0
    }
    
    //Zufällige Startrichtungen generieren
    func getStartVector() -> CGVector {
        
        var yDirection: Int = 20
        var xDirection: Int = 20
        
        if Bool.random() {
            yDirection = -20
        }
        if Bool.random() {
            xDirection = -20
        }
        
        return CGVector(dx: xDirection, dy: yDirection)
        
    }
    

    
    func setSizeSetting(_ wanted: CGSize) -> GameScene {
        
        self.sizeSetting = wanted
        
        return self
    }
    
    func setGameType(_ type: GameTypes) -> GameScene {
        self.gametype = type
        
        return self
    }
    
    
}
