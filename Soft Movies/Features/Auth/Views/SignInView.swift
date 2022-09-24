//
//  SignInView.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import UIKit

final class SignInView: BaseScrollView {
    
    private let illustrationImageView = UIImageView(image: .authIllustration, height: 150)
    private let emailTextField = AppTextField(title: "Email Address", keyboardType: .emailAddress)
    private let passwordTextField = AppTextField(title: "Password", isPassword: true, keyboardType: .numberPad, maxLength: 8)
    let signInButton = AppButton(title: "Sign In")
    let signUpButton = AppButton(title: "Don't have an account? Create New", backgroundColor: .clear, textColor: .primaryTextColor)
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
    
}
