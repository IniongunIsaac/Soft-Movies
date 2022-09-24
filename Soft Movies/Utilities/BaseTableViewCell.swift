//
//  BaseTableViewCell.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation
import UIKit

open class BaseTableViewCell: UITableViewCell {
    
    open func setup() {
        selectionStyle = .none
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
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
