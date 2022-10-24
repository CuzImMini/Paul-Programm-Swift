//
//  GameView#.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 12.10.22.
//

import SwiftUI
import SpriteKit

struct GameView: View {

    @Environment(\.dismiss) private var dismiss
    var selectedGametype: GameTypes

    var scene: GameSceneModifierIOS = GameSceneModifierIOS()

    var body: some View {
        ZStack() {
            SpriteView(
                    scene: scene.getScene(type: selectedGametype)
            )
            HStack(alignment: .center) {
                Button("Quit") {
                    dismiss()
                }
                        .padding(.leading, 8)
                        .font(.system(size: 15, weight: .bold, design: .monospaced))
                        .foregroundColor(.white)
                        .buttonStyle(.bordered)

                Spacer()
                Button("Reset") {
                    scene.getScene().fullReset()
                }
                        .padding(.trailing, 8)
                        .font(.system(size: 15, weight: .bold, design: .monospaced))
                        .foregroundColor(.white)
                        .buttonStyle(.bordered)


            }
        }
                .background(Color(red: 0.1, green: 0.1, blue: 0.1))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(.hidden, for: .automatic)
                .navigationBarBackButtonHidden(false)
                .navigationTitle("")


    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {

        NavigationView {
            GameView(selectedGametype: .multiPlayer)
        }
    }
}
