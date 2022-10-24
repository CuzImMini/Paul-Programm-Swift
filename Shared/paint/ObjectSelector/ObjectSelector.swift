//
//  ObjectSelector.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 08.10.22.
//

import SwiftUI


struct ObjectSelector: View {
        
    @Binding var showObjectSelector: Bool
    @Binding var placeObjects: Bool
    @Binding var selectedObject: DrawingObjekte
    
    @State var gridLayout: [GridItem] = [
        GridItem(.flexible(maximum: 200)),
        GridItem(.flexible(maximum: 200))
    ]
    
    var body: some View {
        VStack {
            Text("Bitte wählen:")
            Divider().frame(maxWidth: 250)
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                ForEach(DrawingObjekte.allCases, id: \.self) {index in
                    
                    DrawingObjectView(showObjectSelector: $showObjectSelector, placeObjects: $placeObjects, selectedObject: $selectedObject, object: index)
                        .scaledToFill()
                        .padding(10)

                }
            }
        }
        .padding(10)
        .frame(minWidth: 400, maxHeight: 275)
        
    }
    
}


struct ObjectSelector_Previews: PreviewProvider {
    static var previews: some View {
        ObjectPlacementButton(engine: PaintEngine(), placeObjects: false, selectedObject: .Haus)    }
}
 
