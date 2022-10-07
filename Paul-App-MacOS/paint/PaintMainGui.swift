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
    let frameHeight: CGFloat = 900
    
    var body: some View {
        VStack() {
            //Titel
            Text("Paul-Paint!")
                .font(.system(size: 35))
                .bold()
                .underline()
                .foregroundColor(.accentColor)
            //Zeichenfläche mit Hintergrund
            Canvas {
                context, size in
                
                context.fill(Path(CGRect(origin: .zero, size: size)), with: .color(engine.hintergrundFarbe))
                
                for linie in engine.alleZeichnungen {
                    var pfad = Path()
                    pfad.addLines(linie.punkte)
                    context.stroke(pfad, with: .color(linie.color), lineWidth: linie.lineWidth)
                }
                
            }
            .border(Color.accentColor, width: 7)

            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onChanged({ value in
                    engine.aktiveZeichnung.color = engine.farbwahl
                    engine.aktiveZeichnung.lineWidth = engine.dickenwahl
                    
                    let punkt = value.location
                    engine.aktiveZeichnung.punkte.append(punkt)
                    engine.alleZeichnungen.append(engine.aktiveZeichnung)
                    
                })
                    .onEnded({
                        value in
                        engine.aktiveZeichnung = Linie(punkte: [])
                        
                        if value.startLocation == value.location {
                            print("Tapppp")
                            
                        }
                        
                    })
            )
            Spacer().frame(maxHeight: 20)
            Divider()
            Spacer().frame(maxHeight: 20)
            //Einstellmöglichkeiten
            HStack() {
                VStack() {
                    FarbWaehler(mode: Farbpalette.pencilColors, ausgewaehlteFarbe: $engine.farbwahl)
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
                    Slider(
                        value: $engine.dickenwahl,
                        in: 1...20
                    )
                    .padding(20)
                    .onChange(of: engine.dickenwahl) { change in
                        engine.dickenwahl = change
                    }
                    .frame(maxWidth: 250)
                    Text("Liniendicke").frame(maxWidth: 250)
                    Spacer().frame(maxHeight: 20)
                    Text("manuell Zeichnen coming soon")
                        .bold()
                        .underline()
                        .padding(15)

                }
                Spacer()
                Divider().frame(maxHeight: 150)
                Spacer()
                VStack() {
                        FarbWaehler(mode: Farbpalette.backgroundColors, ausgewaehlteFarbe: $engine.hintergrundFarbe)
                            .onChange(of: engine.hintergrundFarbe) { newColor in
                                engine.hintergrundFarbe = newColor
                            }
                            .padding(20)
                        Text("Hintergrundfarbe")
                        .frame(minWidth: 300)
                        Spacer()
                        .frame(maxHeight: 20)
                        Button("Objekt platzieren") {
                            engine.clearCanvas()
                            
                        }
                            .padding(15)
                        
                    }
                }
            
                
            }
            .padding(padding)
            .frame(width: frameWidth, height: frameHeight)
            
            
        
    }
    
    
    func correctOffset(_ location: CGPoint) -> CGPoint {
        
        return CGPoint.init(x: location.x - padding - CGFloat(10), y: location.y - padding - CGFloat(10))
    }
    
}

struct PaintMainGui_Previews: PreviewProvider {
    static var previews: some View {
        PaintMainGui()
    }
}
