//
//  App182App.swift
//  App182
//
//  Created by Вячеслав on 8/31/23.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_o2PVSpMgR8GK5TZGrr1X3eMvj9RUHX")
        Amplitude.instance().initializeApiKey("3cf9af904c58ef63d5e3dd07b936d088")

        FirebaseApp.configure()
        
        return true
    }
}

@main
struct App182App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
