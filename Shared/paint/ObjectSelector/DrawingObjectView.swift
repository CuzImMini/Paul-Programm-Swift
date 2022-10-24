//
//  DrawingObjectView.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 08.10.22.
//

import SwiftUI

struct DrawingObjectView: View {

    @Binding var showObjectSelector: Bool
    @Binding var placeObjects: Bool
    @Binding var selectedObject: DrawingObjekte


    var object: DrawingObjekte

    var body: some View {

        ZStack() {
            Rectangle()
                    .cornerRadius(25)
                    .foregroundColor(.blue)
            Text(object.rawValue)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .underline()
        }
                .frame(width: 100, height: 100)
                .gesture(TapGesture()
                        .onEnded() {
                            placeObjects = true
                            selectedObject = object
                            stopView()
                        }
                )

    }

    func stopView() {
        showObjectSelector = false
    }
}

struct DrawingObjectView_Previews: PreviewProvider {
    static var previews: some View {

        ObjectPlacementButton(engine: PaintEngine(), placeObjects: false, selectedObject: .Haus)

    }
}
         
