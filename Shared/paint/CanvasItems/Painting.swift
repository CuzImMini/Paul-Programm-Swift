//
//  Canvas.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 07.10.22.
//

import SwiftUI

struct Painting: View {

    @ObservedObject var engine: PaintEngine

    @State var tapCount: Int = 0
    @State var firstLocation: CGPoint = CGPoint(x: 0, y: 0)


    var body: some View {
        Canvas {
            context, size in

            context.fill(Path(CGRect(origin: .zero, size: size)), with: .color(engine.hintergrundFarbe))

            for linie in engine.alleZeichnungen {
                var pfad = Path()
                pfad.addLines(linie.punkte)
                context.stroke(pfad, with: .color(linie.color), lineWidth: linie.lineWidth)
            }
            for path in engine.allePfade {
                context.stroke(path.path, with: .color(path.color), lineWidth: path.lineWidth)
            }

            var activeLinePath = Path()
            activeLinePath.addLines(engine.aktiveZeichnung.punkte)
            context.stroke(activeLinePath, with: .color(engine.aktiveZeichnung.color), lineWidth: engine.aktiveZeichnung.lineWidth)

            let activePath = engine.aktiverPfad.path
            let activePathColor = engine.aktiverPfad.color
            let activePathThickness = engine.aktiverPfad.lineWidth
            context.stroke(activePath, with: .color(activePathColor), lineWidth: activePathThickness)

        }
                .border(Color.accentColor, width: 7)
                .simultaneousGesture(
                        DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                .onChanged({ value in

                                    if engine.placeObjects {
                                        engine.singleTap(startPosition: value.startLocation, endPosition: value.location)
                                        return
                                    }

                                    engine.aktiveZeichnung.color = engine.farbwahl
                                    engine.aktiveZeichnung.lineWidth = engine.dickenwahl

                                    let punkt = value.location
                                    engine.aktiveZeichnung.punkte.append(punkt)
                                    engine.alleZeichnungen.append(engine.aktiveZeichnung)


                                })
                                .onEnded({
                                    value in

                                    if engine.placeObjects {
                                        engine.alleZeichnungen.append(engine.aktiveZeichnung)
                                        engine.allePfade.append(engine.aktiverPfad)
                                        engine.placeObjects = false
                                        engine.aktiverPfad = PaulPath(path: Path(), color: .black, lineWidth: 2)

                                    }

                                    engine.aktiveZeichnung = Linie(punkte: [])

                                })


                )


    }


}

struct Painting_Preview: PreviewProvider {
    static var previews: some View {
        Painting(engine: PaintEngine())
    }
}
