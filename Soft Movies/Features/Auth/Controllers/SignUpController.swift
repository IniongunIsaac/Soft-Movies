//
//  SignUpController.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import UIKit

final class SignUpController: BaseViewController<SignUpView, IAuthViewModel> {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setBackButtonText()
    }
    
    override func configureViews() {
        super.configureViews()
        backgroundColor = .systemBackground
        kview.viewModel = viewModel
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
