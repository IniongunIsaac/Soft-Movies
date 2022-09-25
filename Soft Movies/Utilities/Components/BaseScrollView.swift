//
//  BaseScrollView.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation
import UIKit

class BaseScrollView: BaseView {
    
    let scrollView = UIScrollView()
    
    override func setup() {
        super.setup()
        with(scrollView) {
            addSubview($0)
            $0.fillSuperview()
            $0.showIndicators(false)
        }
        addConstraints()
    }
    
    override func layout() {
        super.layout()
        self.layoutIfNeeded()
    }
    
    func _addSubviews(_ views: UIView...) {
        scrollView.addSubviews(views)
    }
    
    func _addSubview(_ view: UIView) {
        scrollView.addSubview(view)
    }
    
    func _fillSuperview(_ view: UIView, padding: UIEdgeInsets = .zero) {
        view.anchor(top: _topAnchor, leading: _leadingAnchor, bottom: _bottomAnchor, trailing: _trailingAnchor, padding: padding)
    }
    
    func addConstraints() {}
    
    var _topAnchor: NSLayoutYAxisAnchor? { scrollView._topAnchor }
    
    var _bottomAnchor: NSLayoutYAxisAnchor? { scrollView._bottomAnchor }
    
    var _leadingAnchor: NSLayoutXAxisAnchor? { scrollView._leadingAnchor }
    
    var _trailingAnchor: NSLayoutXAxisAnchor? { scrollView._trailingAnchor }
}
