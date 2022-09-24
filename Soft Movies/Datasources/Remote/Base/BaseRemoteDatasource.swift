//
//  BaseRemoteDatasource.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift

class BaseRemoteDatasource {
    
    func makeAPIRequest<T>(path: RemotePath, responseType: T.Type, method: HTTPMethod = .get, params: Parameters? = nil, encoding: ParameterEncoding = JSONEncoding.default, headers: HTTPHeaders? = nil) -> Observable<T> where T : Decodable, T : Encodable {
        
        _print("Request URL: \(path.requestURL)", .success)
        _print("Request Parameters:\n \(String(describing: params))", .success)
        
        let manager = Session.default
        
        return manager.rx.request(method, path.requestURL, parameters: params, encoding: encoding, headers: headers)
            .validate(statusCode: 200 ..< 499)
            .debug()
            .responseString()
            .flatMap { (_, responseString) -> Observable<T> in

                do {
                    _print(responseString, .success)
                    
                    let requestResponse = try responseType.mapFrom(jsonString: responseString)!
                    
                    return Observable.just(requestResponse)

                } catch let error {
                    _print(error)
                    throw error
                }
        }
        .observeOn(MainScheduler.instance)
        
    }
    
}
