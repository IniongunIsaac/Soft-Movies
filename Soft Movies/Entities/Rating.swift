//
//  Rating.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 25/09/2022.
//

import Foundation
import RealmSwift

class Rating: Object, Codable {
    @Persisted var source: String
    @Persisted var value: String
    
    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
    
    convenience init(source: String, value: String) {
        self.init()
        self.source = source
        self.value = value
    }
    
    var sourceValue: String { "\(source)(\(value))" }
}
