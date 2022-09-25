//
//  AuthViewModelImpl.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation
import RxSwift

final class AuthViewModelImpl: BaseViewModel, IAuthViewModel {
    
    private var preference: IPreference
    private let validator: IInputValidator
    private let localDatasource: ILocalDatasource
    weak var coordinatorDelegate: AuthCoordinatorDelegate?
    
    init(preference: IPreference = PreferenceImpl(),
         validator: IInputValidator = InputValidatorImpl(),
         localDatasource: ILocalDatasource = LocalDatasourceImpl()
    ) {
        self.preference = preference
        self.validator = validator
        self.localDatasource = localDatasource
    }
    
    var validationMessages = PublishSubject<[ValidationMessage]>()
    
    func navigate(to route: AuthNavRoute) {
        coordinatorDelegate?.navigate(to: route)
    }
    
    func signIn(email: String, password: String) {
        var validations = [ValidationMessage]()
        with(validator) {
            validations.append($0.validate(email, for: .email))
            validations.append($0.validate(password, for: .password))
        }
        
        validationMessages.onNext(validations)
        
        if !validations.map({ $0.isValid }).contains(false) {
            
        }
    }
    
    func signUp(fullname: String,
                email: String,
                password: String,
                confirmPassword: String
    ) {
        var validations = [ValidationMessage]()
        with(validator) {
            validations.append($0.validate(fullname, for: .name))
            validations.append($0.validate(email, for: .email))
            validations.append($0.validate(password, for: .password))
            validations.append($0.validateConfirmPassword(password, confirmPassword))
        }
        
        validationMessages.onNext(validations)
        
        if !validations.map({ $0.isValid }).contains(false) {
            let user = User(fullName: fullname, email: email, password: password)
            subscribe(localDatasource.saveItems(items: [user]), success: { [weak self] in
                self?.preference.hasLoggedIn = true
                self?.showMessage("Account created successfully")
                runAfter(0.3) {
                    self?.coordinatorDelegate?.navigate(to: .movies)
                }
            })
        }
    }
    
}
