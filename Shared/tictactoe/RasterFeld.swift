//
//  Feld.swift
//  Paul-Programm-MacOS
//
//  Created by Paul Cornelissen on 02.10.22.
//

import SwiftUI

struct RasterFeld: View {
    @State private var degrees = 0.0
    @Binding var imagePath: String
    
    
    var body: some View {
        
        ZStack {
            Circle()
                .frame(width: 120, height: 120)
                .foregroundColor(.gray)
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
            Image(getImagePath())
                .resizable()
                .frame(width: 100, height: 100)
        }
        .padding(15)
        .rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 1, z: 0))
        .simultaneousGesture(
            TapGesture()
                .onEnded({ _ in
                    withAnimation(.easeIn(duration: 0.25)) {
                        self.degrees -= 180
                    }
                    
                }
                        )
        )
        
    }
    
    
    func getImagePath() -> String {
        if imagePath == String(1) {
            return "tictactoeplayer1"
        }
        if imagePath == String(2) {
            return "tictactoeplayer2"
        }
        return "tictactoenull"
    }
    
}
    
    

struct FeldUI_Previews: PreviewProvider {
    static var previews: some View {
        RasterFeld(imagePath: .constant(String("1")))
        RasterFeld(imagePath: .constant(String("2")))
        RasterFeld(imagePath: .constant(String("0")))
    }
}

