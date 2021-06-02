//
//  AppDelegate.swift
//  GIConsoleExample
//
//  Created by daleijn on 28.05.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupDebugConsoleIfNeeded()
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
       showDebugConsoleIfNeeded()
    }
    
}
