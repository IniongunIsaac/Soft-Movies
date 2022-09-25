//
//  MovieSearch.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 25/09/2022.
//

import Foundation
import RealmSwift

struct MoviesResponse: Codable {
    let results: [Movie]
    let totalResults, response: String
    
    enum CodingKeys: String, CodingKey {
        case results = "Search"
        case totalResults
        case response = "Response"
    }
}

class Movie: Object, Codable {
    @Persisted(primaryKey: true) var imdbID: String
    @Persisted var title: String
    @Persisted var year: String
    @Persisted var type: String
    @Persisted var poster: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
    
    convenience init(imdbID: String, title: String, year: String, type: String, poster: String) {
        self.init()
        self.imdbID = imdbID
        self.title = title
        self.year = year
        self.type = type
        self.poster = poster
    }
}
