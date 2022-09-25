//
//  SignInView.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import UIKit

final class SignInView: BaseScrollView {
    
    var viewModel: IAuthViewModel!
    
    private let illustrationImageView = UIImageView(image: .authIllustration, height: 150)
    private let emailTextField = AppTextField(title: "Email Address", keyboardType: .emailAddress)
    private let passwordTextField = AppTextField(title: "Password", isPassword: true, keyboardType: .numberPad, maxLength: 6)
    private lazy var signInButton = AppButton(title: "Sign In", tapAction: didTapSignInButton)
    private lazy var signUpButton = AppButton(title: "Don't have an account? Create New", backgroundColor: .clear, textColor: .primaryTextColor, tapAction: didTapSignUpButton)
    private lazy var contentStackView = with(VStackView(subviews: [emailTextField, passwordTextField, signInButton, signUpButton], spacing: 20)) {
        $0.setCustomSpacing(40, after: passwordTextField)
    }
    
    override func setup() {
        super.setup()
        _addSubviews(illustrationImageView, contentStackView)
        
        with(illustrationImageView) {
            $0.anchor(top: _topAnchor)
            $0.centerXInSuperview()
        }
        contentStackView.anchor(top: illustrationImageView.bottomAnchor,
                                leading: _leadingAnchor,
                                bottom: _bottomAnchor,
                                trailing: _trailingAnchor,
                                padding: ._init(topBottom: 40, leftRight: 20))
    }
    
    private func didTapSignInButton() {
        viewModel.signIn(email: emailTextField.text, password: passwordTextField.text)
    }
    
    private func didTapSignUpButton() {
        viewModel.navigate(to: .signUp)
    }
    
    func updateValidationMessages(_ messages: [ValidationMessage]) {
        messages.forEach {
            switch $0.validationType {
            case .email:
                emailTextField.updateValidationStatus(message: $0)
            case .password:
                passwordTextField.updateValidationStatus(message: $0)
            default:
                break
            }
        }
    }
    
}
