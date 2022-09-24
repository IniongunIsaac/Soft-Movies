//
//  AppDelegate.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private(set) var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupAppCoordinator()
        IQKeyboardManager.shared.enable = true
        return true
    }

    private func setupAppCoordinator() {
        let window = UIWindow()
        let coordinator = AppCoordinator(window: window)
        self.appCoordinator = coordinator
        self.window = window
        coordinator.start()
    }

}

