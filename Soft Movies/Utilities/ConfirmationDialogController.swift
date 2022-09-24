//
//  ConfirmationDialogController.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation
import UIKit

final class ConfirmationDialogController: UIViewController {
    
    var yesHandler: NoParamHandler?
    var noHandler: NoParamHandler?
    var noText: String = "No"
    var yesText: String = "Yes"
    var confirmationText: String = ""
    
    private lazy var noButton = AppButton(title: noText, backgroundColor: .clear, borderWidth: 1, borderColor: .primaryYellow, height: 50, tapAction: handleNoButtonTapped)
    private lazy var yesButton = AppButton(title: yesText, height: 50, tapAction: handleYesButtonTapped)
    private lazy var buttonsStackView = HStackView(subviews: [noButton, yesButton], spacing: 20, distribution: .fillEqually)
    private lazy var contentStackView = VStackView(subviews: [textLabel, buttonsStackView], spacing: 20)
    private lazy var textLabel = UILabel(text: confirmationText, font: .avenirBold(16), numberOfLines: 0, color: .primaryTextColor, alignment: .center)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        addSubview(contentStackView)
        contentStackView.fillSuperview(padding: ._init(allEdges: 20))
    }
    
    private func handleNoButtonTapped() {
        dismissViewController { [weak self] in
            self?.noHandler?()
        }
    }
    
    private func handleYesButtonTapped() {
        dismissViewController { [weak self] in
            self?.yesHandler?()
        }
    }

}
