//
//  Paul_App_iOSApp.swift
//  Paul-App-iOS
//
//  Created by Paul Cornelissen on 05.10.22.
//

import SwiftUI

@main
struct Paul_App_iOSApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MainMenu()
        }
    }
}


