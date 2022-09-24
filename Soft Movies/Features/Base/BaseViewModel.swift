//
//  BaseViewModel.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation
import RxSwift

class BaseViewModel {
    
    let disposeBag = DisposeBag()
    
    let isLoading: PublishSubject<Bool> = PublishSubject()
    
    let alertMessage: PublishSubject<AlertMessage> = PublishSubject()
    
    func didLoad() {}
    
    func willAppear() {}
    
    func didAppear() {}
    
    func willDisappear() {}
    
    func didDisappear() {}
    
    func showLoading(_ show: Bool = true) {
        isLoading.onNext(show)
    }
    
    func showMessage(_ message: String, type: ToastType = .success) {
        alertMessage.onNext(AlertMessage(message: message, type: type))
    }
    
    func subscribe<T>(_ observable: Observable<T>,
                      showLoadingAnimation: Bool = true,
                      showMessageAlerts: Bool = true,
                      errorMessage: String? = nil,
                      success: ((T) -> Void)? = nil,
                      error: ((Error) -> Void)? = nil
    ) {
        showLoading(showLoadingAnimation)
        observable.subscribe(onNext: { [weak self] response in
            self?.showLoading(false)
            
            success?(response)
            
        }, onError: { [weak self] err in
            self?.showLoading(false)
            
            if showMessageAlerts {
                self?.showMessage(err.localizedDescription, type: .error)
            }
            
            error?(err)
            
        }).disposed(by: disposeBag)
    }
    
}
