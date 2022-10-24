//
//  PaintMainGui.swift
//  Paul-App-MacOS
//
//  Created by Paul Cornelissen on 06.10.22.
//

import SwiftUI

struct PaintMainGui: View {
    @ObservedObject var engine = PaintEngine()
    
    let padding: CGFloat = 25
    let frameWidth: CGFloat = 1100
    let frameHeight: CGFloat = 600
    
    var body: some View {
        VStack() {
            //Titel
            Text("Paul-Paint!")
                .font(.largeTitle)
                .bold()
                .underline()
                .foregroundColor(.accentColor)
            //Zeichenfläche mit Hintergrund
            Painting(engine: engine).frame(width: frameWidth, height: frameHeight)
            Spacer().frame(maxHeight: 20)
            Divider()
            Spacer().frame(maxHeight: 20)
            //Einstellmöglichkeiten
            HStack() {
                VStack() {
                    FarbWaehler(engine: engine, mode: Farbpalette.pencilColors, ausgewaehlteFarbe: $engine.farbwahl)
                        .onChange(of: engine.farbwahl) { newColor in
                            engine.farbwahl = newColor
                        }
                        .padding(20)
                    Text("Stiftfarbe")
                        .frame(minWidth: 300)
                    Spacer()
                        .frame(maxHeight: 20)
                    Button("Zeichenfläche leeren") {engine.clearCanvas()}
                        .padding(15)
                }
                Spacer()
                Divider().frame(maxHeight: 150)
                Spacer()
                VStack() {
                    Dickenwaehler(engine: engine)
                    
                    
                }
                Spacer()
                Divider().frame(maxHeight: 150)
                Spacer()
                VStack() {
                    FarbWaehler(engine: engine, mode: Farbpalette.backgroundColors, ausgewaehlteFarbe: $engine.hintergrundFarbe)
                        .padding(20)
                    Text("Hintergrundfarbe")
                        .frame(minWidth: 300)
                    Spacer()
                        .frame(maxHeight: 20)
                    ObjectPlacementButton(engine: engine, placeObjects: engine.placeObjects, selectedObject: engine.selectedObject)
                    
                }
            }
            
            
        }
        .padding(padding)
        
        
        
    }
    
    
    func Offset(_ location: CGPoint, xOffset: CGFloat, yOffset: CGFloat) -> CGPoint {
        
        return CGPoint.init(x: location.x + xOffset, y: location.y + yOffset)
    }
    
}

struct PaintMainGui_Previews: PreviewProvider {
    static var previews: some View {
        PaintMainGui()
    }
}
