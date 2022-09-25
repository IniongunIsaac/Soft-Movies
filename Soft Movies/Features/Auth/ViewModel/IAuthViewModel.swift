//
//  IAuthViewModel.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation
import RxSwift

protocol IAuthViewModel {
    
    var validationMessages: PublishSubject<[ValidationMessage]> { get set }
    
    var coordinatorDelegate: AuthCoordinatorDelegate? { get set }
    
    func getUser()
    
    func navigate(to route: AuthNavRoute)
    
    func signIn(email: String, password: String)
    
    func signUp(fullname: String, email: String, password: String, confirmPassword: String)
    
}
