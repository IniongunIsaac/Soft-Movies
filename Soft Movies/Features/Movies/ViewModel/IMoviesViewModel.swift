//
//  IMoviesViewModel.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 25/09/2022.
//

import Foundation
import RxSwift

protocol IMoviesViewModel {
    
    var coordinatorDelegate: MoviesCoordinatorDelegate? { get set }
    
    var movies: [Movie] { get set }
    
    var movieDetails: MovieDetail? { get set }
    
    var showMovies: PublishSubject<Bool> { get }
    
    func getMovies()
    
    func getMovieDetails(_ id: String)
    
}
