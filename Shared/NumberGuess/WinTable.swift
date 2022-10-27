//
//  WinTable.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 26.10.22.
//

import SwiftUI

struct WinTable: View {
    var body: some View {
        ScrollView() {
        VStack(alignment: .leading, spacing: 10) {
            HStack() {
                Text("eiskalt: ").foregroundColor(.accentColor)
                Text("Entfernung > 20")
                
            }
            HStack() {
                Text("wärmer: ").foregroundColor(.yellow)
                Text("Entfernung 10...20")
                
            }
            HStack() {
                Text("ziemlich warm: ").foregroundColor(.yellow)
                Text("Entfernung 5...10")
                
            }
            HStack() {
                Text("sehr heiß: ").foregroundColor(.orange)
                Text("Entfernung < 5")
                
            }
            
        }
        
    }
}
}

struct WinTable_Previews: PreviewProvider {
    static var previews: some View {
        WinTable()
    }
}
