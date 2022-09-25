//
//  MovieDetail.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 25/09/2022.
//

import Foundation
import RealmSwift

class MovieDetail: Object, Codable {
    @Persisted(primaryKey: true) var imdbID: String
    @Persisted var title: String?
    @Persisted var year: String?
    @Persisted var rated: String?
    @Persisted var released: String?
    @Persisted var runtime: String?
    @Persisted var genre: String?
    @Persisted var director: String?
    @Persisted var writer: String?
    @Persisted var actors: String?
    @Persisted var plot: String?
    @Persisted var language: String?
    @Persisted var country: String?
    @Persisted var awards: String?
    @Persisted var poster: String?
    @Persisted var metascore: String?
    @Persisted var imdbRating: String?
    @Persisted var imdbVotes: String?
    @Persisted var type: String?
    @Persisted var dvd: String?
    @Persisted var boxOffice: String?
    @Persisted var production: String?
    @Persisted var website: String?
    @Persisted var response: String?
    @Persisted var ratings: List<Rating>
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metascore = "Metascore"
        case imdbRating, imdbVotes, imdbID
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case response = "Response"
    }
    
    convenience init(title: String?, year: String?, rated: String?, released: String?, runtime: String?, genre: String?, director: String?, writer: String?, actors: String?, plot: String?, language: String?, country: String?, awards: String?, poster: String?, metascore: String?, imdbRating: String?, imdbVotes: String?, imdbID: String, type: String?, dvd: String?, boxOffice: String?, production: String?, website: String?, response: String?, ratings: [Rating]) {
        self.init()
        self.title = title
        self.year = year
        self.rated = rated
        self.released = released
        self.runtime = runtime
        self.genre = genre
        self.director = director
        self.writer =  writer
        self.actors = actors
        self.plot = plot
        self.language = language
        self.country = country
        self.awards = awards
        self.poster = poster
        self.metascore = metascore
        self.imdbRating = imdbRating
        self.imdbVotes = imdbVotes
        self.imdbID = imdbID
        self.type = type
        self.dvd = dvd
        self.boxOffice = boxOffice
        self.production = production
        self.website = website
        self.response = response
        self.ratings.append(objectsIn: ratings)
    }
    
    var ratingsText: String {
        ratings.map { $0.sourceValue }.joined(separator: ", ")
    }
    
//    var movie: Movie {
//        Movie(imdbID: imdbID, title: title.orNA, year: year.orNA, type: type.orNA, poster: poster.orNA)
//    }
}
