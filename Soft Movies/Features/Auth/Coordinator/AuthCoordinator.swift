//
//  AuthCoordinator.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation
import UIKit

final class AuthCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var rootViewController: UIViewController
    private let navController: UINavigationController
    private let preference: IPreference
    private lazy var authViewModel: IAuthViewModel = AuthViewModelImpl()
    
    init(root: UINavigationController, preference: IPreference = PreferenceImpl()) {
        self.navController = root
        self.rootViewController = root
        self.preference = preference
        authViewModel.coordinatorDelegate = self
    }
    
    func start() {
        preference.hasLoggedIn ? showLogin() : showSignUp()
    }
    
    private func showLogin() {
        with(SignInController(viewModel: authViewModel)) {
            navController.pushViewController($0, animated: true)
        }
    }
    
    private func showSignUp() {
        with(SignUpController(viewModel: authViewModel)) {
            navController.pushViewController($0, animated: true)
        }
    }
    
}

extension AuthCoordinator: AuthCoordinatorDelegate {
    func navigate(to route: AuthNavRoute) {
        guard navController.viewControllers.count < 2 else {
            navController.popViewController(animated: true)
            return
        }
        switch route {
        case .signIn:
            showLogin()
        case .signUp:
            showSignUp()
        }
    }
}
