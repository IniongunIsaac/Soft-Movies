//
//  BaseViewController.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation
import RxSwift
import RxCocoa
import HorizontalProgressBar

class BaseViewController<VW: UIView, VM: Any>: UIViewController {
    
    let kview: VW
    private let baseViewModel: BaseViewModel
    var viewModel: VM
    let disposeBag = DisposeBag()
    var progressBar: HorizontalProgressbar?
    
    var horizontalProgressBarYPosition: CGFloat { notchHeight }
    
    var progressBarColor: UIColor { .primaryTextColor }
    
    init(viewModel: VM) {
        self.baseViewModel = viewModel as! BaseViewModel
        self.viewModel = viewModel
        kview = VW(frame: .zero)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundColor = .systemBackground
        addSubview(kview)
        addSubviewConstraints()
        setObservers()
        baseViewModel.didLoad()
        configureViews()
    }
    
    func addSubviewConstraints() {
        kview.anchor(top: safeAreaTopAnchor, leading: safeAreaLeadingAnchor, bottom: safeAreaBottomAnchor, trailing: safeAreaTrailingAnchor)
    }
    
    func configureViews() {}
    
    fileprivate func createHorizontalProgressBar() {
        progressBar = HorizontalProgressbar(frame: CGRect(x: 0, y: horizontalProgressBarYPosition, width: view.frame.width, height: 4))
        view.addSubview(progressBar!)
        progressBar?.noOfChunks = 1  // You can provide number of Chunks/Strips appearing over the animation. By default it is 3
        progressBar?.kChunkWdith = Double(view.frame.width) - 20 // Adjust the width of Chunks/Strips
        progressBar?.progressTintColor = progressBarColor  // To change the Chunks color
        progressBar?.trackTintColor = UIColor.darkGray  // To change background color of loading indicator
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hideKeyboard()
    }
    
    fileprivate func setObservers() {
        observeLoadingState()
        observeAlertMessages()
        setChildViewControllerObservers()
    }
    
    func setChildViewControllerObservers() {}
    
    fileprivate func observeAlertMessages() {
        baseViewModel.alertMessage.bind { [weak self] value in
            self?.showMessage(value.message, type: value.type)
        }.disposed(by: disposeBag)
    }
    
    private func observeLoadingState() {
        baseViewModel.isLoading.bind { [weak self] show in
            if show {
                self?.showLoading()
            } else {
                self?.hideLoading()
            }
        }.disposed(by: disposeBag)
    }
    
    func showLoading() {
        hideLoading()
        createHorizontalProgressBar()
        progressBar?.startAnimating()
        view.enableUserInteraction(false)
    }
    
    func hideLoading() {
        progressBar?.stopAnimating()
        view.enableUserInteraction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideAlert()
        hideKeyboard()
        baseViewModel.willAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hideAlert()
        hideKeyboard()
        baseViewModel.willDisappear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        baseViewModel.didAppear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        baseViewModel.didDisappear()
    }
    
}
