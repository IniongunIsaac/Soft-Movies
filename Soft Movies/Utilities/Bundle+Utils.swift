//
//  Bundle+Utils.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation
import UIKit

extension Bundle {
    
    func value<T>(for key: String) -> T? {
        object(forInfoDictionaryKey: key) as? T
    }
    
    var baseURL: String { value(for: "BASE_URL")! }
    
    var apiKey: String { value(for: "API_KEY")! }
    
}
