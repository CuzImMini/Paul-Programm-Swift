//
//  ObjectPlacementButton.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 08.10.22.
//

import SwiftUI

struct ObjectPlacementButton: View {
    
    @ObservedObject var engine: PaintEngine
    
    @State var showObjectSelector: Bool
    @State var placeObjects: Bool
    @State var selectedObject: DrawingObjekte
    
    var sheetScaleEffect: CGFloat = 1
    
    init(engine: PaintEngine, placeObjects: Bool, selectedObject: DrawingObjekte) {
        self.engine = engine
        self.showObjectSelector = false
        self.placeObjects = placeObjects
        self.selectedObject = selectedObject
    }
    
    init(engine: PaintEngine, placeObjects: Bool, selectedObject: DrawingObjekte, sheetScale: CGFloat) {
        self.engine = engine
        self.showObjectSelector = false
        self.placeObjects = placeObjects
        self.selectedObject = selectedObject
        self.sheetScaleEffect = sheetScale
    }
    
    var body: some View {
        Button("Objekte platzieren") {
            self.showObjectSelector = true
        }
        .buttonStyle(.bordered)
        .sheet(isPresented: $showObjectSelector) {
            ObjectSelector(showObjectSelector: $showObjectSelector, placeObjects: $placeObjects, selectedObject: $selectedObject)
                .scaleEffect(sheetScaleEffect)
                .frame(width: 600, height: 300)

        }
        .onChange(of: placeObjects) {value in
            
                engine.placeObjects = value
        }
        .onChange(of: selectedObject) {value in
            engine.selectedObject = value

        }
        .onChange(of: showObjectSelector) { value in
        }
        .onChange(of: engine.placeObjects) {value in
            self.placeObjects = value

        }
        .padding(15)
        
        
    }
    

    
        
}

struct ObjectPlacementButton_Previews: PreviewProvider {
    static var previews: some View {
        ObjectPlacementButton(engine: PaintEngine(), placeObjects: false, selectedObject: .Haus)
    }
}

