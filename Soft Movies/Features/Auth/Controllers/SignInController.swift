//
//  SignInController.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import UIKit

final class SignInController: BaseViewController<SignInView, IAuthViewModel> {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setBackButtonText()
    }
    
    override func configureViews() {
        super.configureViews()
        backgroundColor = .systemBackground
        kview.viewModel = viewModel
        viewModel.getUser()
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        viewModel.validationMessages.bind { validations in
            if !validations.isEmpty {
                self.kview.updateValidationMessages(validations)
            }
        }.disposed(by: disposeBag)
    }

}
