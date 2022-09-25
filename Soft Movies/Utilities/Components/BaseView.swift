//
//  BaseView.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation
import UIKit

open class BaseView: UIView {

    open func setup() {
        backgroundColor = .systemBackground
    }
    
    open func layout() {}
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
