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
    private lazy var viewModel: IMoviesViewModel = MoviesViewModelImpl()
    
    init(navController: UINavigationController) {
        self.rootViewController = navController
        self.navController = navController
        viewModel.coordinatorDelegate = self
    }
    
    func start() {
        showMovies()
    }
    
    private func showMovies() {
        with(MoviesController(viewModel: viewModel)) {
            navController.pushViewController($0, animated: true)
        }
    }
    
    private func showMovieDetails() {
        with(MovieDetailsController(viewModel: viewModel)) {
            navController.pushViewController($0, animated: true)
        }
    }
    
}

extension MoviesCoordinator: MoviesCoordinatorDelegate {
    func navigate(to route: MoviesNavRoute) {
        switch route {
        case .profile:
            break
        case .movieDetails:
            showMovieDetails()
        case .back:
            navController.popViewController(animated: true)
        }
    }
}
