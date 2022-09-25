//
//  User.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 25/09/2022.
//

import Foundation
import RealmSwift

class User: Object {
    @Persisted(primaryKey: true) var userId: Int
    @Persisted var fullName: String
    @Persisted var email: String
    @Persisted var password: String
    
    convenience init(userId: Int = 1, fullName: String, email: String, password: String) {
        self.init()
        self.userId = userId
        self.fullName = fullName
        self.email = email
        self.password = password
    }
    
}
