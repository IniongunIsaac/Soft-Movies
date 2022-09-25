//
//  UIViewController+Utils.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation
import UIKit
import PopupDialog

extension UIViewController {
    
    func configureNavBar(title: String,
                         barBgColor: UIColor = .primaryYellow,
                         font: UIFont = .avenirBold(16),
                         barTextColor: UIColor = .primaryTextColor,
                         prefersLargeTitle: Bool = false
    ) {
        self.title = title
        navigationController?.navigationBar.apply {
            $0.prefersLargeTitles = prefersLargeTitle
            $0.barTintColor = barBgColor
            $0.titleTextAttributes = [.foregroundColor: barTextColor, .font: font]
            $0.largeTitleTextAttributes = [.foregroundColor: barTextColor, .font: font]
            $0.tintColor = barTextColor
        }
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
    
    func addSubview(_ view: UIView) {
        self.view.addSubview(view)
    }
    
    var topAnchor: NSLayoutYAxisAnchor? { view.topAnchor }
    
    var bottomAnchor: NSLayoutYAxisAnchor? { view.bottomAnchor }
    
    var leadingAnchor: NSLayoutXAxisAnchor? { view.leadingAnchor }
    
    var trailingAnchor: NSLayoutXAxisAnchor? { view.trailingAnchor }
    
    var safeAreaTopAnchor: NSLayoutYAxisAnchor? { view.safeAreaLayoutGuide.topAnchor }
    
    var safeAreaBottomAnchor: NSLayoutYAxisAnchor? { view.safeAreaLayoutGuide.bottomAnchor }
    
    var safeAreaLeadingAnchor: NSLayoutXAxisAnchor? { view.safeAreaLayoutGuide.leadingAnchor }
    
    var safeAreaTrailingAnchor: NSLayoutXAxisAnchor? { view.safeAreaLayoutGuide.trailingAnchor }
    
    var backgroundColor: UIColor? {
        get { view.backgroundColor }
        set { view.backgroundColor = newValue }
    }
    
    func showNavBar(_ show: Bool = true) {
        navigationController?.navigationBar.isHidden = !show
        navigationController?.setNavigationBarHidden(!show, animated: true)
        navigationController?.isNavigationBarHidden = !show
    }
    
    func setBackButtonText(_ text: String = "") {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: text, style: .plain, target: nil, action: nil)
    }
    
    func dismissViewController(animated: Bool = true, completion: (() -> Void)? = nil) {
        dismiss(animated: animated, completion: completion)
    }
    
    func showMessage(_ message: String, type: ToastType = .success) {
        Toast.shared.show(message, type: type)
    }
    
    func hideAlert() {
        Toast.shared.hideToast()
    }
    
    func showDialog(for viewController: UIViewController, opacity: CGFloat = 0.1, tapToDismiss: Bool = true, dismissCompletionHandler: (() -> Void)? = nil) {
        let containerAppearance = PopupDialogContainerView.appearance()
        containerAppearance.cornerRadius = Float(10)
        
        let overlayAppearance = PopupDialogOverlayView.appearance()
        overlayAppearance.opacity = opacity
        
        let popupDialog = PopupDialog(viewController: viewController, transitionStyle: .bounceUp, tapGestureDismissal: tapToDismiss, panGestureDismissal: tapToDismiss, completion: dismissCompletionHandler)
        present(popupDialog, animated: true, completion: nil)
    }
    
    func showConfirmationDialogViewController(confirmationText: String = "Are you sure you want to perform action?",
                                              yestText: String = "Yes",
                                              noText: String = "No",
                                              tapToDismiss: Bool = true,
                                              noHandler: NoParamHandler? = nil,
                                              dismissHandler: NoParamHandler? = nil,
                                              yesHandler: NoParamHandler?
    ) {
        showDialog(for: ConfirmationDialogController().apply {
            $0.confirmationText = confirmationText
            $0.yesText = yestText
            $0.noText = noText
            $0.noHandler = noHandler
            $0.yesHandler = yesHandler
        }, tapToDismiss: tapToDismiss, dismissCompletionHandler: dismissHandler)
    }
}
