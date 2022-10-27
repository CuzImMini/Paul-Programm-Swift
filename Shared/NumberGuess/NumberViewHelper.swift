//
//  NumberViewHelper.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 26.10.22.
//

import SwiftUI

struct NumberViewHelper: View {
    
    var text: String
    var text2: String?
    var underline: Bool
    var big: Bool
    var color: Color
    
    var body: some View {
        if big {
            ZStack {
                Rectangle()
                    .cornerRadius(20)
                    .foregroundColor(color).frame(maxWidth: 340, maxHeight: 160)
                VStack {
                    if underline {
                        Text(text).font(.system(size: 35)).bold()                    .foregroundColor(.white)
                            .underline()
                    }
                    else {
                        Text(text).font(.system(size: 35)).bold()                    .foregroundColor(.white)
                        
                    }
                    if text2 != "" {
                        Text(text2 ?? "").font(.system(size: 25)).foregroundColor(.white)
                    }
                }
            }
        }
        else {
            
            ZStack {
                Rectangle()
                    .cornerRadius(20)
                    .foregroundColor(color).frame(maxWidth: 170, maxHeight: 80)
                VStack {
                    if underline {
                        Text(text).font(.system(size: 20)).bold()                    .foregroundColor(.white)
                            .underline()
                    }
                    else {
                        Text(text).font(.system(size: 20)).bold()                    .foregroundColor(.white)
                        
                    }
                    if text2 != "" {
                        Text(text2 ?? "").font(.system(size: 15)).foregroundColor(.white)
                    }
                }
            }
            
        }
    }
}

struct NumberViewHelper_Previews: PreviewProvider {
    static var previews: some View {
        NumberViewHelper(text: "Test", text2: "", underline: false, big: true, color: .blue)
    }
}
