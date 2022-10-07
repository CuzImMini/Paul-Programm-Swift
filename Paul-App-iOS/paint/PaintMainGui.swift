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
    
    var canvas: some View {
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
    
    var body: some View {
        VStack() {
            canvas
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
        
    }
    
}

struct PaintMainGui_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView() {
            PaintMainGui()
        }}
}
