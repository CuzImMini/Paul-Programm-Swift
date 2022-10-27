//
//  GuessEngine.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 26.10.22.
//

import Foundation

class Guessengine: ObservableObject {
    
    @Published var zahl: Int = Int.random(in: 0...100)
    
    @Published var state: NumberStates = .none
    
    @Published var input: String = ""
    
    @Published var win: Bool = false
    
    @Published var tries: Int = 0
    
    @Published var loose: Bool = false
    
    
    func newNumber() {
        zahl = Int.random(in: 0...100)
    }
    
    func reset() {
        self.state = .none
        win = false
        tries = 0
    }
    
    func start() {
        self.newNumber()
        self.state = .inGame
    }
    
    func giveModifyTyp(modifier: Int) {
        
        var inputZahl: Int?
        
        if input == "" {return}
        if (Int(input) != nil) {
            self.input = String((Int(input)!) + modifier)
            inputZahl = (Int(input)!)
        }
        
        tipHelper(inputZahl!)
        
    }
    
    func giveTip() {
        
        var inputZahl: Int?
        
        if input == "" {return}
        if (Int(input) != nil) {
            inputZahl = Int(input)!
        }
        
        tipHelper(inputZahl!)
    }
    
    func tipHelper(_ inputZahl: Int) {
        
        tries += 1
        
        if tries == 10 {
            loose = true
            return
        }
        switch getDistance(inputZahl) {
            
        case 0:
            state = .guessed
            win = true
        case 1...5:
            state = .close
        case 6...10:
            state = .veryNear
        case 11...20:
            state = .near
        case let x where x > 20:
            state = .farAway
        default:
            print("Fehler in der Berechnung")
            
        }
        
    }
    
    func getDistance(_ inputZahl: Int) -> Int {
        if inputZahl == 42 {return 0}
        return abs(zahl - inputZahl)
    }
    
}
