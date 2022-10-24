//
//  WelcomeView.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 24.10.22.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack() {
            Image(systemName: "graduationcap.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.accentColor)
            #if os(iOS)
                    .navigationBarTitle("Hauptmenü", displayMode: .automatic)
            #endif
            Spacer().frame(width: 10, height: 40)
            Text("Willkommen beim Paul-Programm!")
                    .font(.system(size: 44))
                    .foregroundColor(.primary)
        }    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
