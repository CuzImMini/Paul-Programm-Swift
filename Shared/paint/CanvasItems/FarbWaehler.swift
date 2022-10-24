//
//  FarbWähler.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 06.10.22.
//

import SwiftUI

struct FarbWaehler: View {

    @ObservedObject var engine: PaintEngine

    var mode: Farbpalette

    @Binding var ausgewaehlteFarbe: Color

    let pencilColors = [Color.black, Color.red, Color.green, Color.blue, Color.yellow, Color.gray, Color.init(red: 0.9, green: 0.9, blue: 0.9)]
    let backgroundColors = [Color.black, Color.gray, Color.red, Color.blue, Color.purple, Color.mint, Color.init(red: 0.9, green: 0.9, blue: 0.9)]


    var body: some View {
        HStack() {
            ForEach(mode == Farbpalette.pencilColors ? pencilColors : backgroundColors, id: \.self) { color in

                ZStack() {
                    Color.white.clipShape(Circle()).frame(width: 35, height: 35)

                    Image(systemName: ausgewaehlteFarbe == color ?
                            "record.circle.fill" : "circle.fill")
                            .foregroundColor(color)
                            .font(.system(size: 30))
                            .clipShape(Circle())
                            .onTapGesture {
                                ausgewaehlteFarbe = color
                            }
                }
            }
        }
                .onChange(of: engine.hintergrundFarbe) { newColor in
                    engine.hintergrundFarbe = newColor
                }

    }

}

enum Farbpalette: CaseIterable {
    case pencilColors
    case backgroundColors
}

struct FarbWaehler_Previews: PreviewProvider {
    static var previews: some View {
        FarbWaehler(engine: PaintEngine(), mode: Farbpalette.pencilColors, ausgewaehlteFarbe: .constant(Color.black))
    }
}


