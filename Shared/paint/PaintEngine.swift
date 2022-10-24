//
//  PaintEngine.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 06.10.22.
//

import Foundation
import SwiftUI

class PaintEngine: ObservableObject {
    
    @Published var aktiveZeichnung = Linie()
    @Published var aktiverPfad = PaulPath(path: Path(), color: .black, lineWidth: 2)
    @Published var alleZeichnungen: [Linie] = []
    @Published var allePfade: [PaulPath] = []
    
    @Published var farbwahl: Color = .black
    @Published var dickenwahl: Double = 2.5
    @Published var hintergrundFarbe: Color = Color.init(red: 0.9, green: 0.9, blue: 0.9)
    
    @Published var placeObjects: Bool = false
    @Published var selectedObject: DrawingObjekte = .Quadrat
    
    func clearCanvas() {
        alleZeichnungen = []
        allePfade = []
    }
    
    func singleTap(startPosition: CGPoint, endPosition: CGPoint) {
        switch selectedObject {
            
        case .Quadrat:
            self.zeichneQuadrat(startPosition, endPosition)
        case .Haus:
            self.zeichneHaus(startPosition, endPosition)
            
        case .Kreis:
            self.zeichneKreis(startPosition, endPosition)
            
        case .Dreieck:
            self.zeichneDreieck(startPosition, endPosition)
            
        }
    }
    
    func zeichneQuadrat(_ startPosition: CGPoint, _ endPosition: CGPoint) {
        aktiveZeichnung =
        Linie(
            punkte: [
                CGPoint(x: startPosition.x, y: startPosition.y),
                CGPoint(x: endPosition.x, y: startPosition.y),
                CGPoint(x: endPosition.x, y: endPosition.y),
                CGPoint(x: startPosition.x, y: endPosition.y),
                CGPoint(x: startPosition.x, y: startPosition.y),
                CGPoint(x: endPosition.x, y: startPosition.y)
                
            ],
            color: farbwahl,
            lineWidth: dickenwahl
        )
        
    }
    
    func zeichneDreieck(_ startPosition: CGPoint, _ endPosition: CGPoint) {
        aktiveZeichnung =
        Linie(
            punkte: [
                CGPoint(x: startPosition.x + ((endPosition.x - startPosition.x)/2), y: startPosition.y),
                CGPoint(x: endPosition.x, y: endPosition.y),
                CGPoint(x: startPosition.x, y: endPosition.y),
                CGPoint(x: startPosition.x + ((endPosition.x - startPosition.x)/2), y: startPosition.y),
                CGPoint(x: endPosition.x, y: endPosition.y)
                
            ],
            color: farbwahl,
            lineWidth: dickenwahl
        )
        
    }
    
    func zeichneHaus(_ startPosition: CGPoint, _ endPosition: CGPoint) {
        
        aktiveZeichnung =
        Linie(
            punkte: [
                //1
                CGPoint(x: startPosition.x + ((endPosition.x - startPosition.x)/2), y: startPosition.y),
                //2
                CGPoint(x: endPosition.x, y: endPosition.y + ((startPosition.y - endPosition.y)/1.5)),
                //3
                CGPoint(x: endPosition.x, y: endPosition.y),
                //4
                CGPoint(x: startPosition.x, y: endPosition.y),
                //5
                CGPoint(x: startPosition.x, y: endPosition.y + ((startPosition.y - endPosition.y)/1.5)),
                //6
                CGPoint(x: startPosition.x + ((endPosition.x - startPosition.x)/2), y: startPosition.y),
                //2
                CGPoint(x: endPosition.x, y: endPosition.y + ((startPosition.y - endPosition.y)/1.5)),
                //5
                CGPoint(x: startPosition.x, y: endPosition.y + ((startPosition.y - endPosition.y)/1.5)),
                //3
                CGPoint(x: endPosition.x, y: endPosition.y),
                //4
                CGPoint(x: startPosition.x, y: endPosition.y),
                //2
                CGPoint(x: endPosition.x, y: endPosition.y + ((startPosition.y - endPosition.y)/1.5)),
                
                
                
                
                
            ],
            color: farbwahl,
            lineWidth: dickenwahl
        )
        
        
    }
    
    func zeichneKreis(_ startPosition: CGPoint, _ endPosition: CGPoint) {
        
        let pfad = Path(ellipseIn: CGRect(x: startPosition.x, y: startPosition.y, width: endPosition.x - startPosition.x, height: endPosition.y - startPosition.y))
        
        aktiverPfad = PaulPath(path: pfad, color: farbwahl, lineWidth: dickenwahl
        )
        
        
    }
    
}

