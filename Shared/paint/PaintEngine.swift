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
    @Published var alleZeichnungen: [Linie] = []
    
    @Published var farbwahl: Color = .black
    @Published var dickenwahl: Double = 2.5
    @Published var hintergrundFarbe: Color = Color.init(red: 0.9, green: 0.9, blue: 0.9)

    func clearCanvas() {
        alleZeichnungen = []
    }
    
    func getCanvas() -> some View {
        return Canvas {
            context, size in
            
            context.fill(Path(CGRect(origin: .zero, size: size)), with: .color(self.hintergrundFarbe))
            
            for linie in self.alleZeichnungen {
                var pfad = Path()
                pfad.addLines(linie.punkte)
                context.stroke(pfad, with: .color(linie.color), lineWidth: linie.lineWidth)
            }
            
        }
        .border(Color.accentColor, width: 7)

        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onChanged({ value in
                self.aktiveZeichnung.color = self.farbwahl
                self.aktiveZeichnung.lineWidth = self.dickenwahl
                
                let punkt = value.location
                self.aktiveZeichnung.punkte.append(punkt)
                self.alleZeichnungen.append(self.aktiveZeichnung)
                
            })
                .onEnded({
                    value in
                    self.aktiveZeichnung = Linie(punkte: [])
                    
                    if value.startLocation == value.location {
                        print("Tapppp")
                        
                    }
                    
                })
        )
    }
    
    
    
}
