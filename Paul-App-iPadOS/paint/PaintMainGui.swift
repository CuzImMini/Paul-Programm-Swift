//
//  PaintMainGui.swift
//  Paul-App-MacOS
//
//  Created by Paul Cornelissen on 06.10.22.
//

import SwiftUI

struct PaintMainGui: View {
    
    @ObservedObject var engine = PaintEngine()
    
    private var padding: CGFloat = 25
    
    var body: some View {
        VStack() {
            Canvas {
                context, size in
                
                for linie in engine.alleZeichnungen {
                    var pfad = Path()
                    pfad.addLines(linie.punkte)
                    context.stroke(pfad, with: .color(linie.color), lineWidth: linie.lineWidth)
                }
                
            }
            .border(.black)
            
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onChanged({ value in
                    
                    let punkt = value.location
                    engine.aktiveZeichnung.punkte.append(punkt)
                    engine.alleZeichnungen.append(engine.aktiveZeichnung)
                    
                })
                    .onEnded({
                        value in
                        engine.aktiveZeichnung = Linie(punkte: [])
                        
                    })
            )
        }
        .navigationTitle("Paul-Paint")
        .toolbar() {
            ToolbarItem(placement: .automatic) {
                Button("Reset") {
                    engine.clearCanvas()
                    
                }
            }
        }
        .padding(padding)
        .frame(width: 900, height: 600)
        
    }
    
    
}

struct PaintMainGui_Previews: PreviewProvider {
    static var previews: some View {
        PaintMainGui()
    }
}
