//
//  MovieDetailsController.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 25/09/2022.
//

import UIKit

final class MovieDetailsController: BaseViewController<MovieDetailsView, IMoviesViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureViews() {
        super.configureViews()
        with(kview) {
            $0.viewModel = viewModel
            $0.showDetails()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showNavBar(false)
    }

}
