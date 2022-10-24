//
//  AppDelegate.swift
//  Paul-App
//
//  Created by Paul Cornelissen on 06.10.22.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()

        let attributes: [NSAttributedString.Key: Any] = [:

        ]
        appearance.largeTitleTextAttributes = attributes
        UINavigationBar.appearance().scrollEdgeAppearance = appearance


        print("Paul-App gestartet!")
        return true
    }

}
