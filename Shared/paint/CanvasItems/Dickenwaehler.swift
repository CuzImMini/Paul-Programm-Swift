//
//  Dickenwaehler.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 08.10.22.
//

import SwiftUI

struct Dickenwaehler: View {

    @ObservedObject var engine: PaintEngine

    var body: some View {

        VStack {
            Slider(
                    value: $engine.dickenwahl,
                    in: 1...20
            )
                    .padding(20)
                    .onChange(of: engine.dickenwahl) { change in
                        engine.dickenwahl = change
                    }
                    .frame(maxWidth: 250)
            Text("Liniendicke").frame(maxWidth: 250).padding(.bottom, 10)

        }

    }
}

struct Dickenwaehler_Previews: PreviewProvider {
    static var previews: some View {
        Dickenwaehler(engine: PaintEngine())
    }
}
