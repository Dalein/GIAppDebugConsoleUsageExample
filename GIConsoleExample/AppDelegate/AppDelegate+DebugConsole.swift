//
//  AppDelegate+DebugConsole.swift
//  GIConsoleExample
//
//  Created by ivan.gnatyuk on 02.06.2021.
//

import UIKit
import GIAppDebugConsole

extension AppDelegate {
    
    func setupDebugConsoleIfNeeded() {
        configConsole()
    }
    
    func showDebugConsoleIfNeeded() {
        GIAppDebugConsole.shared.show()
    }
    
}


// MARK: - DebugConsole config
private extension AppDelegate {
    
    func configConsole() {
        // You don't have to configure anything. Only if you want.
        ///*
        GIAppDebugConsoleConfigurator.configureAppDebugConsole(
            consoleUIConfig: .init(consoleDefaultSize: .init(width: 300, height: 200),
                                   consoleMaxSize: .init(width: 500, height: 500),
                                   consoleBackgroundColor: .black,
                                   textColor: .white,
                                   menuButtonConfig: .init(size: .init(width: 34, height: 34),
                                                           backgroundColor: .systemGray,
                                                           image: .init(named: "ellipsis"),
                                                           title: nil,
                                                           tintColor: .green,
                                                           alpha: 0.7)))
         //*/
        
        
        // Add custom actions to console menu
        
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
