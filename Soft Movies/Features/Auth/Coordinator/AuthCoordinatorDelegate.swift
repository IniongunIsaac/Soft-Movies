//
//  AuthCoordinatorDelegate.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation

protocol AuthCoordinatorDelegate: AnyObject {
    func navigate(to route: AuthNavRoute)
}
