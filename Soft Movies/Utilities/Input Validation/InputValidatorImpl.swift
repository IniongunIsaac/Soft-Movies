//
//  InputValidatorImpl.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation

final class InputValidatorImpl: IInputValidator {
    
    func validateEmailAddress(_ email: String) -> ValidationMessage {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        if email.isEmpty {
            return ValidationMessage(message: "Cannot be empty", validationType: .email)
        } else if !emailPredicate.evaluate(with: email.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return ValidationMessage(message: "Invalid email address", validationType: .email)
        }
        
        return ValidationMessage(isValid: true, message: "", validationType: .email)
    }
    
    func validateName(_ name: String) -> ValidationMessage {
        let nameRegex = "[A-Za-z ]{2,}"
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        
        if name.isEmpty {
            return ValidationMessage(message: "Cannot be empty", validationType: .name)
        } else if !namePredicate.evaluate(with: name.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return ValidationMessage(message: "Must be at least 2 characters", validationType: .name)
        }
        
        return ValidationMessage(isValid: true, message: "", validationType: .name)
    }
    
    func validatePassword(_ password: String) -> ValidationMessage {
        if password.isEmpty {
            return ValidationMessage(message: "Cannot be empty", validationType: .password)
        } else if password.count < 6 {
            return ValidationMessage(message: "Minimum 6 characters", validationType: .password)
        }
        
        return ValidationMessage(isValid: true, message: "", validationType: .password)
    }
    
    func validateConfirmPassword(_ password: String, _ confirmPassword: String) -> ValidationMessage {
        if confirmPassword.isEmpty {
            return ValidationMessage(message: "Cannot be empty", validationType: .confirmPassword)
        } else if confirmPassword.count < 6 {
            return ValidationMessage(message: "Minimum 6 characters", validationType: .confirmPassword)
        } else if password != confirmPassword {
            return ValidationMessage(message: "Password mismatch", validationType: .confirmPassword)
        }
        
        return ValidationMessage(isValid: true, message: "", validationType: .confirmPassword)
    }
    
    func validate(_ value: String, for type: ValidationType) -> ValidationMessage {
        switch type {
        case .email:
            return validateEmailAddress(value)
        case .password:
            return validatePassword(value)
        case .confirmPassword:
            return validatePassword(value)
        case .name:
            return validateName(value)
        }
    }
    
}
