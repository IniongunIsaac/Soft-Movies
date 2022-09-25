//
//  BaseCollectionViewCell.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation
import UIKit
import RxSwift

class BaseCollectionViewCell: UICollectionViewCell {
    open func setup() {}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func _addSubview(_ view: UIView) {
        contentView.addSubview(view)
    }
    
    func _addSubviews(_ views: [UIView]) {
        contentView.addSubviews(views)
    }
    
    func _addSubviews(_ views: UIView...) {
        contentView.addSubviews(views)
    }
    
    var _topAnchor: NSLayoutYAxisAnchor? { contentView.topAnchor }
    
    var _bottomAnchor: NSLayoutYAxisAnchor? { contentView.bottomAnchor }
    
    var _leadingAnchor: NSLayoutXAxisAnchor? { contentView.leadingAnchor }
    
    var _trailingAnchor: NSLayoutXAxisAnchor? { contentView.trailingAnchor }
}
