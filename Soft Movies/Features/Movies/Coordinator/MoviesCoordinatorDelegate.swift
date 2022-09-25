//
//  MoviesCoordinatorDelegate.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 25/09/2022.
//

import Foundation

protocol MoviesCoordinatorDelegate: AnyObject {
    func navigate(to route: MoviesNavRoute)
}
