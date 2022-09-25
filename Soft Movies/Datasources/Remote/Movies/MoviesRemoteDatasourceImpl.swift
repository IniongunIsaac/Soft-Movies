//
//  MoviesRemoteDatasourceImpl.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 25/09/2022.
//

import Foundation
import Alamofire
import RxSwift

final class MoviesRemoteDatasourceImpl: BaseRemoteDatasource, IMoviesRemoteDatasource {
    
    func search(params: Parameters) -> Observable<MoviesResponse> {
        makeAPIRequest(path: .movies, responseType: MoviesResponse.self, params: params, encoding: URLEncoding.default)
    }
    
    func getMovieDetails(params: Parameters) -> Observable<MovieDetail> {
        makeAPIRequest(path: .movies, responseType: MovieDetail.self, params: params, encoding: URLEncoding.default)
    }
    
}
