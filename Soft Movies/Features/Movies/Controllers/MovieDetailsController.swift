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
        kview.viewModel = viewModel
    }

}
