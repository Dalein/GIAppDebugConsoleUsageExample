//
//  AppDelegate.swift
//  GIConsoleExample
//
//  Created by daleijn on 28.05.2021.
//

import UIKit
import GIAppDebugConsole

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configConsole()
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        GIAppDebugConsole.shared.show()
    }
    
}


// MARK: - DebugConsole config
private extension AppDelegate {
    
    func configConsole() {
        GIAppDebugConsoleConfigurator.configureAppDebugConsole(consoleUIConfig: .init(consoleBackgroundColor: .black,
                                                                                      textColor: .systemGreen,
                                                                                      font: .systemFont(ofSize: 14, weight: .light),
                                                                                      menuButtonConfig: .init(image: .init(named: "ellipsis"))))
        
        GIAppDebugConsole.shared.addAction(.init(title: "Copy Push token", handler: { [weak self] in
            self?.copyPushToken()
        }))
        
        GIAppDebugConsole.shared.addAction(.init(title: "Do a barrel roll", handler: { [weak self] in
            self?.doBarrelRoll()
        }))
    }
    
}


// MARK: - DebugConsole actions
private extension AppDelegate {
    
    func doBarrelRoll() {
        let viewToRoll = UIApplication.shared.windows.first
        UIView.animate(withDuration: 1) {
            viewToRoll?.transform = .init(rotationAngle: .pi)
        } completion: { _ in
            viewToRoll?.transform = .identity
        }
    }
    
    func copyPushToken() {
        let pushToken = "YOUR_PUSH_TOKEN"
        
        UIPasteboard.general.string = pushToken
        print("push token copied")
    }
    
}
