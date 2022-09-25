//
//  LocalDatasourceImpl.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 25/09/2022.
//

import Foundation
import RxSwift
import RealmSwift

struct LocalDatasourceImpl: ILocalDatasource {
    
    private let realm = try! Realm()
    
    func getItems<T: Object>(for type: T.Type) -> Observable<[T]> {
        Observable.just(Array(realm.objects(type)))
    }
    
    func saveItems<T: Object>(items: [T]) -> Observable<Void> {
        realm.insertItems(items: items)
    }
    
    func deleteItems<T: Object>(for type: T.Type) -> Observable<Void> {
        realm.deleteItems(for: type)
    }
}
