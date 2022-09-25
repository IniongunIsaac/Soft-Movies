//
//  ILocalDatasource.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 25/09/2022.
//

import Foundation
import RxSwift
import RealmSwift

protocol ILocalDatasource {
    
    func getItems<T: Object>(for type: T.Type) -> Observable<[T]>
    
    func saveItems<T: Object>(items: [T]) -> Observable<Void>
    
    func deleteItems<T: Object>(for type: T.Type) -> Observable<Void>
    
}
