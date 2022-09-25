//
//  AuthViewModelImpl.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation
import RxSwift

final class AuthViewModelImpl: BaseViewModel, IAuthViewModel {
    
    private let preference: IPreference
    private let validator: IInputValidator
    weak var coordinatorDelegate: AuthCoordinatorDelegate?
    
    init(preference: IPreference = PreferenceImpl(),
         validator: IInputValidator = InputValidatorImpl()
    ) {
        self.preference = preference
        self.validator = validator
    }
    
    func navigate(to route: AuthNavRoute) {
        coordinatorDelegate?.navigate(to: route)
    }
    
    func signIn(email: String, password: String) {
        
    }
    
    func signUp(fullname: String, email: String, password: String, confirmPassword: String) {
        
    }
    
}
