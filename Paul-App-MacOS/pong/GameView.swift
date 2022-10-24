//
//  GameView#.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 12.10.22.
//

import SwiftUI
import SpriteKit
//iOS 16 Navigation-Stack

struct GameView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var viewType: PongStates
    
    var selectedGametype: GameTypes
    
    var scene: GameSceneModifierMac = GameSceneModifierMac()
    
    var body: some View {
        ZStack() {
                SpriteView(
                    scene: scene.getScene(orientation: .Portrait, type: selectedGametype)
                )
            
            
            HStack(alignment: .center) {
                Button("Quit") {viewType = .OptionMenu}
                    .padding(.leading, 10)
                    .font(.system(size: 15, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
                    .buttonStyle(.bordered)
                Spacer()
                Button("Reset") {scene.getScene().fullReset()}
                    .padding(.trailing, 10)
                    .font(.system(size: 15, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
                    .buttonStyle(.bordered)
                
                
            }
            
        }
        
        .background(Color(red: 0.1, green: 0.1, blue: 0.1))
        
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            GameView(viewType: .constant(.activeSinglePlayer1), selectedGametype: .multiPlayer)
        }
    }
}
