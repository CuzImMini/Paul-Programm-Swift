//
//  PaintMainGui.swift
//  Paul-App-MacOS
//
//  Created by Paul Cornelissen on 06.10.22.
//

import SwiftUI

struct PaintMainGui: View {
    @ObservedObject var engine = PaintEngine()

    var paintingWidth: CGFloat = 300
    var paintingHeight: CGFloat = 600

    let padding: CGFloat = 15

    var painting: some View {
        Painting(engine: engine)
    }

    var body: some View {
        VStack() {
            //Zeichenfläche mit Hintergrund
            painting
                    .padding(padding)
            Divider().padding(.horizontal, padding)
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
                    }
                    Divider().frame(maxHeight: 100)
                    VStack() {
                        Dickenwaehler(engine: engine)
                                .frame(minWidth: 250)
                        Spacer().frame(maxHeight: 20)

                    }
                    Divider().frame(maxHeight: 100)
                    ObjectPlacementButton(engine: engine, placeObjects: engine.placeObjects, selectedObject: engine.selectedObject)
                            .padding(15)
                    Divider().frame(maxHeight: 100)
                    VStack() {
                        FarbWaehler(engine: engine, mode: Farbpalette.backgroundColors, ausgewaehlteFarbe: $engine.hintergrundFarbe)
                                .padding(20)
                        Text("Hintergrundfarbe")
                                .frame(minWidth: 300)
                        Spacer()
                                .frame(maxHeight: 20)
                    }

                }
            }
                    .padding(.horizontal, padding)

        }
                .toolbar() {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Leeren") {
                            engine.clearCanvas()
                        }
                    }

                }
                .navigationTitle("Paul-Paint!")


    }

}

struct PaintMainGui_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView() {
            PaintMainGui()

        }
    }
}

/*
extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}
*/
