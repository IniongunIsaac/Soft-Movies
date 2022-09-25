//
//  MoviesCoordinator.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 25/09/2022.
//

import Foundation
import UIKit

final class MoviesCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var rootViewController: UIViewController
    private let navController: UINavigationController
    
    init(navController: UINavigationController) {
        self.rootViewController = navController
        self.navController = navController
    }
    
    func start() {
        
    }
    
    
}

extension MoviesCoordinator: MoviesCoordinatorDelegate {
    func navigate(to route: MoviesNavRoute) {
        switch route {
        case .profile:
            break
        }
    }
}
