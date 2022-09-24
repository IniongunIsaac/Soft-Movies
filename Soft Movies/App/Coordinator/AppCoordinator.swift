//
//  AppCoordinator.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    
    let window: UIWindow
    
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var rootViewController: UIViewController
   
    init(window: UIWindow) {
        self.window = window
        let authCoordinator = AuthCoordinator(root: UINavigationController())
        authCoordinator.start()
        rootViewController = authCoordinator.rootViewController
        addChild(authCoordinator)
    }
    
    func start() {
        makeWindowKeyAndVisible()
    }
    
    private func makeWindowKeyAndVisible() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
}
