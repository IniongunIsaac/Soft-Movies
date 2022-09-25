//
//  SignInController.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import UIKit

final class SignInController: BaseViewController<SignInView, IAuthViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundColor = .aSystemBackground
    }
    
    override func configureViews() {
        super.configureViews()
        kview.viewModel = viewModel
    }

}
