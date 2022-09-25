//
//  IMoviesRemoteDatasource.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 25/09/2022.
//

import Foundation
import RxSwift
import Alamofire

protocol IMoviesRemoteDatasource {
    
    func search(params: Parameters) -> Observable<MoviesResponse>
    
    func getMovieDetails(params: Parameters) -> Observable<MovieDetail>
    
}
