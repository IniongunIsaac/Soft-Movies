//
//  PreferenceImpl.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation

struct PreferenceImpl: IPreference {
    
    @UserDefaultPrimitive(key: .hasLoggedIn, default: false)
    var hasLoggedIn: Bool
}
