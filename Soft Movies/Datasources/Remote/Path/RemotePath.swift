//
//  RemotePath.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation

enum RemotePath: String {
    case movies
    
    var requestURL: String {
        switch self {
        case .movies:
            return Bundle.main.baseURL
        }
    }
    
}
