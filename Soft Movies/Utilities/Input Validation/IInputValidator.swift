//
//  IInputValidator.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation

protocol IInputValidator {
    
    func validateEmailAddress(_ email: String) -> ValidationMessage
    
    func validateName(_ name: String) -> ValidationMessage
    
    func validatePassword(_ password: String) -> ValidationMessage
    
    func validateConfirmPassword(_ password: String, _ confirmPassword: String) -> ValidationMessage
    
    func validate(_ value: String, for type: ValidationType) -> ValidationMessage
    
}
