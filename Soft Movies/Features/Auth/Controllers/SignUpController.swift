//
//  SignUpController.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import UIKit

final class SignUpController: BaseViewController<SignUpView, IAuthViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackButtonText()
    }
    
    override func configureViews() {
        super.configureViews()
        kview.viewModel = viewModel
    }

}
