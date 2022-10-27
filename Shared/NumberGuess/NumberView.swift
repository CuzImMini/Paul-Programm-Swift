//
//  NumberView.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 26.10.22.
//

import SwiftUI

struct NumberView: View {
    
    @Binding var state: NumberStates
    
    var big: Bool
    
    var body: some View {
        switch state {
        case .none:
            ZStack {
                
                if big {
                    NumberViewHelper(text: state.rawValue, text2: "Klicke zum Start", underline: true, big: true, color: .blue)
                }
                else {
                    NumberViewHelper(text: state.rawValue, text2: "Klicke zum Start", underline: true, big: false, color: .blue)
                }
            }
        case .farAway:
            
            if big {
                NumberViewHelper(text: state.rawValue, text2: "", underline: true, big: true, color: .accentColor)
            }
            else {
                NumberViewHelper(text: state.rawValue, text2: "", underline: true, big: false, color: .accentColor)
            }
        case .near, .veryNear:
            if big {
                NumberViewHelper(text: state.rawValue, text2: "", underline: true, big: true, color: .yellow)
            }
            else {
                NumberViewHelper(text: state.rawValue, text2: "", underline: true, big: false, color: .yellow)
            }
        case .guessed:
            if big {
                NumberViewHelper(text: state.rawValue, text2: "", underline: true, big: true, color: .green)
            }
            else {
                NumberViewHelper(text: state.rawValue, text2: "", underline: true, big: false, color: .green)
            }
        case .inGame:
            if big {
                NumberViewHelper(text: state.rawValue, text2: "", underline: true, big: true, color: .gray)
            }
            else {
                NumberViewHelper(text: state.rawValue, text2: "", underline: true, big: false, color: .gray)
            }
        case .close:
            if big {
                NumberViewHelper(text: state.rawValue, text2: "", underline: true, big: true, color: .orange)
            }
            else {
                NumberViewHelper(text: state.rawValue, text2: "", underline: true, big: false, color: .orange)
            }
        }
        
    }
}

struct NumberView_Previews: PreviewProvider {
    static var previews: some View {
        NumberView(state: .constant(.none), big: true)
    }
}


