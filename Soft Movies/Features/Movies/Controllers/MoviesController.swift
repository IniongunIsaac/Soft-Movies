//
//  MoviesController.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 25/09/2022.
//

import UIKit

final class MoviesController: BaseViewController<MoviesView, IMoviesViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        addProfileNavBarButton()
        title = "Trending Movies"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func addProfileNavBarButton() {
        let profileImageView = UIImageView(image: .profileIcon, tintColor: .primaryTextColor, size: 33)
        profileImageView.animateViewOnTapGesture(completion: didTapProfileButton)
        let navMenuButton = UIBarButtonItem(customView: profileImageView)
        navigationItem.rightBarButtonItem = navMenuButton
    }
    
    @objc private func didTapProfileButton() {
        
    }
    
    override func configureViews() {
        super.configureViews()
        kview.viewModel = viewModel
        viewModel.getMovies()
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        viewModel.showMovies.bind { show in
            if show {
                self.kview.reloadMovies()
            }
        }.disposed(by: disposeBag)
    }

}
