//
//  ScoreIndicator.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 10.10.22.
//

import SwiftUI

struct ScoreIndicator: View {
    
    @Binding var score: [Int]
    
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(20)
                .foregroundColor(.accentColor).frame(maxWidth: 120, maxHeight: 80)
            VStack {
                Text("Spielstand").font(.system(size: 20)).bold().underline().foregroundColor(.white)
                Text("Rot: \(score[0]) | Blau: \(score[1])").font(.system(size: 15)).foregroundColor(.white)
            }
        }
        
    }
}

struct ScoreIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ScoreIndicator(score: .constant([0,0]))
    }
}
