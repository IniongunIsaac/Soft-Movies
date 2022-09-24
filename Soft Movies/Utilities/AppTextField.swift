//
//  AppTextField.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation
import UIKit

final class AppTextField: BaseView {
    private let titleLabel = UILabel(text: "Title Label", font: .avenirRegular(14), numberOfLines: 0, color: .aSecondaryLabel, alignment: .left)
    private let errorLabel = UILabel(text: "Error Label", font: .avenirRegular(13), numberOfLines: 0, color: .systemRed, alignment: .left)
    let textField = TextField()
    private let passwordIconImageView = UIImageView(image: .eyeOpenIcon, tintColor: .aSecondaryLabel, size: 22)
    private var passwordVisible = true
    private var heightConstraint: NSLayoutConstraint?
    private var errorLabelHeightConstraint: NSLayoutConstraint?
    private var errorLabelVisible = false
    private var maxLength: Int? = nil
    
    var text: String {
        get { textField.text ?? "" }
        set { textField.text = newValue }
    }
    
    convenience init(title: String,
                     placeholder: String = "",
                     isPassword: Bool = false,
                     height: CGFloat? = 80,
                     keyboardType: UIKeyboardType = .alphabet,
                     maxLength: Int? = nil
    ) {
        self.init(frame: .zero)
        backgroundColor = .clear
        titleLabel.text = title
        
        with(textField) {
            $0.keyboardType = keyboardType
            $0.backgroundColor = .clear
            $0.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.font: UIFont.avenirRegular(14), .foregroundColor: UIColor.aPlaceholderText])
            $0.font = .avenirRegular(15)
            $0.delegate = self
        }
        
        titleLabel.constraintHeight(constant: titleLabel.intrinsicContentSize.height)
        self.maxLength = maxLength
        
        if let height = height {
            heightConstraint = constraintHeight(constant: height)
        }
        
        if isPassword {
            setupPassword()
        }
    }
    
    func setupPassword() {
        let paddingView = UIView(size: 15, backgroundColor: .clear)
        let passwordIconStackView = HStackView(subviews: [passwordIconImageView, paddingView], alignment: .center)
        with(textField) {
            $0.padding = ._init(top: 0, left: 15, bottom: 0, right: 45)
            $0.rightView = passwordIconStackView
            $0.rightViewMode = .always
            $0.isSecureTextEntry = true
            $0.setNeedsLayout()
            $0.layoutIfNeeded()
        }
        passwordIconImageView.animateViewOnTapGesture(duration: 0.1, completion: togglePasswordVisibility)
    }
    
    func togglePasswordVisibility() {
        passwordIconImageView.image = passwordVisible ? .eyeClosedIcon : .eyeOpenIcon
        textField.isSecureTextEntry = !passwordVisible
        passwordVisible.toggle()
    }
    
    override public func setup() {
        super.setup()
        addSubviews(titleLabel, textField, errorLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor)
        
        with(textField) {
            $0.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: ._init(top: 5))
            $0.constraintHeight(constant: 50)
            $0.viewCornerRadius = 6
            $0.viewBorderWidth = 1
            $0.borderColor = .aSecondaryLabel
            $0.clipsToBounds = true
        }
        
        with(errorLabel) {
            $0.anchor(top: textField.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: ._init(top: 4))
            $0.showView(false)
        }
    }
    
    func showError(_ message: String) {
        with(errorLabel) {
            $0.text = message
            if !errorLabelVisible {
                errorLabelVisible = true
                errorLabelHeightConstraint = $0.constraintHeight(constant: errorLabel.intrinsicContentSize.height)
                heightConstraint?.constant += errorLabelHeightConstraint!.constant
                _animate(duration: 0.2) { [weak self] in
                    self?.errorLabel.showView()
                    self?.updateTextFieldAppearance(success: false)
                    self?.layoutIfNeeded()
                }
            }
        }
        
    }
    
    func hideError() {
        if errorLabelVisible {
            errorLabelVisible = false
            heightConstraint?.constant -= (errorLabelHeightConstraint?.constant ?? 0)
            errorLabelHeightConstraint?.constant = 0
        }
        _animate(duration: 0.2) { [weak self] in
            self?.errorLabel.showView(false)
            self?.updateTextFieldAppearance()
            self?.layoutIfNeeded()
        }
    }
    
    fileprivate func updateTextFieldAppearance(success: Bool = true) {
        with(textField) {
            $0.borderColor = success ? .primaryTextColor.withAlphaComponent(0.7) : .systemRed
            $0.textColor = success ? .primaryTextColor : .systemRed
        }
    }
    
}

extension AppTextField: UITextFieldDelegate {
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        restrictTextfield(range, string)
    }
    
    fileprivate func restrictTextfield(_ range: NSRange, _ string: String) -> Bool {
        if let maxLength = maxLength {
            if [.numberPad, .phonePad].contains(textField.keyboardType) {
                return textField.restrictToDigitsWithMaximumLength(range: range, string: string, maxLength: maxLength)
            } else {
                return textField.restrictToMaximumLength(range: range, string: string, maxLength: maxLength)
            }
        } else {
            if [.numberPad, .phonePad].contains(textField.keyboardType) {
                return textField.restrictInputToDigits(string: string)
            }
            return true
        }
    }
    
}

class TextField: UITextField {

    var padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}
