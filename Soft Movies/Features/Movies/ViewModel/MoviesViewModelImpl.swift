//
//  MoviesViewModelImpl.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 25/09/2022.
//

import Foundation
import RxSwift
import Alamofire

final class MoviesViewModelImpl: BaseViewModel, IMoviesViewModel {
    
    private let localDatasource: ILocalDatasource
    private let moviesRemote: IMoviesRemoteDatasource
    weak var coordinatorDelegate: MoviesCoordinatorDelegate?
    var movies = [Movie]()
    var showMovies = PublishSubject<Bool>()
    
    init(localDatasource: ILocalDatasource = LocalDatasourceImpl(),
         moviesRemote: IMoviesRemoteDatasource = MoviesRemoteDatasourceImpl()
    ) {
        self.localDatasource = localDatasource
        self.moviesRemote = moviesRemote
    }
    
    func getMovies() {
        getLocalMovies()
        subscribe(Observable.zip(moviesRemote.search(params: movieParams()),
                                 moviesRemote.search(params: movieParams(page: 2)))
                  , success: { [weak self] page1Movies, page2Movies in
            let movies = page1Movies.results + page2Movies.results
            self?.saveMovies(movies)
            self?.movies = movies
            self?.showMovies.onNext(true)
        })
    }
    
    private func getLocalMovies() {
        subscribe(localDatasource.getItems(for: Movie.self), success: { [weak self] movies in
            self?.movies = movies
            self?.showMovies.onNext(true)
        })
    }
    
    private func saveMovies(_ movies: [Movie]) {
        subscribe(localDatasource.saveItems(items: movies))
    }
    
    func getMovieDetails(_ id: String) {
        
    }
    
    private func movieParams(searchTerm: String = "Batman", page: Int = 1) -> Parameters {
        [
            "apikey": Bundle.main.apiKey,
            "s": searchTerm,
            "page": page
        ]
    }
}
