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
        GIAppDebugConsoleConfigurator.configureAppDebugConsole(
            consoleUIConfig: .init(consoleDefaultSize: .init(width: 300, height: 200),
                                   consoleMaxSize: .init(width: 500, height: 500),
                                   consoleBackgroundColor: .red,
                                   textColor: .white,
                                   font: .systemFont(ofSize: 20, weight: .bold),
                                   menuButtonConfig: .init(size: .init(width: 50, height: 50),
                                                           backgroundColor: .black,
                                                           image: .init(named: "ellipsis"),
                                                           title: nil,
                                                           tintColor: .blue, alpha: 0.7)))
        
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
