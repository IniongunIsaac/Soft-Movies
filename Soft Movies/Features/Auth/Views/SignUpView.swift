//
//  SignUpView.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation
import UIKit

final class SignUpView: BaseScrollView {
    
    var viewModel: IAuthViewModel!
    
    private let titleLabel = UILabel(text: "Create Account", font: .avenirExtraBold(25), alignment: .left)
    private let fullNameTextField = AppTextField(title: "Fullname")
    private let emailTextField = AppTextField(title: "Email Address", keyboardType: .emailAddress)
    private let passwordTextField = AppTextField(title: "Password", isPassword: true, keyboardType: .numberPad)
    private let confirmPasswordTextField = AppTextField(title: "Confirm Password", isPassword: true, keyboardType: .numberPad)
    private lazy var signUpButton = AppButton(title: "Sign Up", tapAction: didTapSignUpButton)
    private lazy var signInButton = AppButton(title: "Already have an account? Sign In", backgroundColor: .clear, textColor: .primaryTextColor, tapAction: didTapSignInButton)
    private lazy var contentStackView = VStackView(subviews: [titleLabel,
                                                              fullNameTextField,
                                                              emailTextField,
                                                              passwordTextField,
                                                              confirmPasswordTextField,
                                                              signUpButton,
                                                              signInButton], spacing: 20)
    
    override func setup() {
        super.setup()
        with(contentStackView) {
            _addSubview($0)
            $0.setCustomSpacing(40, after: confirmPasswordTextField)
            $0.anchor(top: _topAnchor,
                      leading: _leadingAnchor,
                      bottom: _bottomAnchor,
                      trailing: _trailingAnchor,
                      padding: ._init(allEdges: 20))
        }
        
    }
    
    private func didTapSignInButton() {
        viewModel.navigate(to: .signIn)
    }
    
    private func didTapSignUpButton() {
        viewModel.signUp(fullname: fullNameTextField.text,
                         email: emailTextField.text,
                         password: passwordTextField.text,
                         confirmPassword: confirmPasswordTextField.text)
    }
    
}
