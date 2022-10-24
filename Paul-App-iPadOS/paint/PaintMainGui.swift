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

    var painting: some View {
        return Painting(engine: engine)
    }

    var body: some View {
        VStack() {

            //Zeichenfläche mit Hintergrund
            painting
            Spacer().frame(maxHeight: 10)
            Divider()
            Spacer().frame(maxHeight: 10)
            //Einstellmöglichkeiten
            ScrollView(.horizontal) {
                HStack() {
                    HStack() {
                        VStack() {
                            FarbWaehler(engine: engine, mode: Farbpalette.pencilColors, ausgewaehlteFarbe: $engine.farbwahl)
                                    .padding(20)
                            Text("Stiftfarbe")
                            Spacer()
                                    .frame(maxHeight: 20)

                        }
                        Divider().frame(maxHeight: 100)
                    }
                    VStack() {
                        Dickenwaehler(engine: engine)
                                .frame(minWidth: 250)
                        Spacer().frame(maxHeight: 20)

                    }
                    Divider().frame(maxHeight: 100)
                    VStack() {
                        FarbWaehler(engine: engine, mode: Farbpalette.backgroundColors, ausgewaehlteFarbe: $engine.hintergrundFarbe)
                                .padding(20)
                        Text("Hintergrundfarbe")
                                .frame(minWidth: 300)
                        Spacer()
                                .frame(maxHeight: 20)

                    }
                    Divider().frame(maxHeight: 100)
                    ObjectPlacementButton(engine: engine, placeObjects: engine.placeObjects, selectedObject: engine.selectedObject, sheetScale: 1.5)
                            .padding(15)
                }
            }

        }
                .toolbar() {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Leeren") {

                            engine.clearCanvas()
                        }
                                .buttonStyle(.bordered)

                    }
                }

                .padding(padding)
                .navigationTitle("Paul-Paint!")


    }

}

struct PaintMainGui_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView() {
            Text("Test")
            PaintMainGui()
        }
    }
}
