//
//  UIView+Utils.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation
import UIKit
import Kingfisher
import RxSwift
import RxCocoa
import AttributedStringBuilder

//MARK: - Custom UIViewTapGestureRecognizer
public class UIViewTapGestureRecognizer: UITapGestureRecognizer {
    var action : (()->Void)? = nil
}

extension UIView {
    
    static func spacer(_ height: CGFloat = 10) -> UIView {
        UIView(height: height, backgroundColor: .clear)
    }
    
    static func hspacer(_ width: CGFloat = 10) -> UIView {
        UIView(width: width, backgroundColor: .clear)
    }
    
    static func separatorLine(_ color: UIColor = .separator) -> UIView {
        UIView(height: 1, backgroundColor: color)
    }
    
    convenience init(subviews: [UIView]? = nil,
                     height: CGFloat? = nil,
                     width: CGFloat? = nil,
                     size: CGFloat? = nil,
                     backgroundColor: UIColor? = nil,
                     borderWidth: CGFloat? = nil,
                     borderColor: UIColor? = nil,
                     radius: CGFloat? = nil
    ) {
        self.init()
        if let subviews = subviews {
            addSubviews(subviews)
        }
        if let height = height {
            constraintHeight(constant: height)
        }
        if let width = width {
            constraintWidth(constant: width)
        }
        if let size = size {
            constraintSize(constant: size)
        }
        if let backgroundColor = backgroundColor {
            self.backgroundColor = backgroundColor
        }
        if let radius = radius {
            viewCornerRadius = radius
        }
        if let borderWidth = borderWidth {
            viewBorderWidth = borderWidth
        }
        if let borderColor = borderColor {
            self.borderColor = borderColor
        }
    }
    
    var id: String? {
        get { accessibilityIdentifier }
        set { accessibilityIdentifier = newValue }
    }
    
    func addRoundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    var viewCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    var viewBorderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    func addTapGesture(action: @escaping () -> Void ){
        let tap = UIViewTapGestureRecognizer(target: self , action: #selector(self.handleTap(_:)))
        tap.action = action
        tap.numberOfTapsRequired = 1
        
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
        
    }
    
    @objc func handleTap(_ sender: UIViewTapGestureRecognizer) {
        sender.action!()
    }
    
    func fadeIn(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
        self.alpha = 0.0
        
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.isHidden = false
            self.alpha = 1.0
        }, completion: completion)
    }
    
    func fadeOut(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
        self.alpha = 1.0
        
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }) { (completed) in
            self.isHidden = true
            completion(true)
        }
    }
    
    func addDropShadow(color: UIColor = .darkGray, opacity: Float = 0.5, offSet: CGSize = CGSize(width: -1, height: 1), radius: CGFloat = 5, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func addCornerRadius(radius: CGFloat = 5, maskToBounds: Bool = true) {
        layer.cornerRadius = radius
        layer.masksToBounds = maskToBounds
    }
    
    func animateOnClick(completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 0.5
        }) { completed in
            UIView.animate(withDuration: 0.5, animations: {
                self.alpha = 1
                completion?()
            })
        }
    }
    
    func showView(_ show: Bool = true) {
        isHidden = !show
    }
    
    func animateView(duration: TimeInterval = 0.5, completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.5
        }) { completed in
            UIView.animate(withDuration: duration, animations: {
                self.alpha = 1
                completion?()
            })
        }
    }
    
    func animateViewOnTapGesture(duration: TimeInterval = 0.2, completion: (() -> Void)? = nil) {
        addTapGesture {
            self.animateView(duration: duration, completion: completion)
        }
    }
    
    func animateView(duration: TimeInterval = 0.5, completion: ((_ : String?) -> Void)? = nil) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.5
        }) { completed in
            UIView.animate(withDuration: duration, animations: {
                self.alpha = 1
                completion?(nil)
            })
        }
    }
    
    func enableUserInteraction(_ enable: Bool = true) {
        isUserInteractionEnabled = enable
    }
    
    var width: CGFloat { frame.size.width }
    
    var height: CGFloat { frame.size.height }
    
    var minY: CGFloat { frame.minY }
    
    var maxY: CGFloat { frame.maxY }
    
    var minX: CGFloat { frame.minX }
    
    var maxX: CGFloat { frame.maxX }
    
    var x: CGFloat {
        get { frame.origin.x }
        set { frame.origin.x = newValue }
    }
    
    var y: CGFloat {
        get { frame.origin.y }
        set { frame.origin.y = newValue }
    }
    
    func addClearBackground() {
        backgroundColor = .clear
    }
    
    func applyShadow(radius:CGFloat = 5){
        layer.shadowColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.09).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = radius
        layer.shadowOffset = .init(width: 0, height: radius)
        
    }
    
    func applyShadowWith(radius: CGFloat) {
        var shadowLayer: CAShapeLayer!

        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
            shadowLayer.fillColor = UIColor.clear.cgColor
            shadowLayer.shadowColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.09).cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = .init(width: 0, height: 10)
            shadowLayer.shadowOpacity = 0.8
            shadowLayer.shadowRadius = 5
            
            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
    
    func setBackgroundColor(_ color: UIColor) {
        backgroundColor = color
    }
    
    func bringToFront(_ views: UIView...) {
        views.forEach { bringSubviewToFront($0) }
    }
    
    func faded(_ fade: Bool = true, alpha: CGFloat = 0.7) {
        self.alpha = fade ? alpha : 1
    }
    
    @objc func dismissKeyboard() {
        endEditing(true)
    }
}

extension Array where Element == UIView {
    func addClearBackground() {
        forEach { $0.addClearBackground() }
    }
    
    func showViews(_ show: Bool = true) {
        forEach { $0.showView(show) }
    }
    
    func enableUserInteraction(_ enable: Bool = true) {
        forEach { $0.enableUserInteraction(enable) }
    }
    
    func addRoundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        forEach { $0.addRoundCorners(corners, radius: radius) }
    }
    
    func faded(_ fade: Bool = true, alpha: CGFloat = 0.7) {
        forEach { $0.faded(fade, alpha: alpha) }
    }
}

// MARK: - UICollectionView Extensions
extension UICollectionView {
    func deque<T: UICollectionViewCell>(cell: T.Type, at indexPath: IndexPath) -> T {
        dequeueReusableCell(withReuseIdentifier: cell.className, for: indexPath) as! T
    }
}

extension UIImageView {
    func setImageFromURL(url: String, placeholderImage: UIImage? = nil) {
        if let url = URL(string: url) {
            let processor = DownsamplingImageProcessor(size: self.bounds.size)
            self.kf.indicatorType = .activity
            self.kf .setImage(
                with: url,
                placeholder: placeholderImage,
                options: [
                    .processor(processor),
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
        }
    }
      
    convenience init(image: UIImage? = nil,
                     contentMode: UIView.ContentMode = .scaleAspectFit,
                     tintColor: UIColor? = nil,
                     size: CGFloat? = nil,
                     height: CGFloat? = nil,
                     width: CGFloat? = nil,
                     cornerRadius: CGFloat? = nil,
                     backgroundColor: UIColor? = nil
    ) {
        self.init(image: image)
        
        if let tintColor = tintColor {
            self.tintColor = tintColor
        }
        self.contentMode = contentMode
        if let size = size {
            constraintSize(constant: size)
        }
        if let height = height {
            constraintHeight(constant: height)
        }
        if let width = width {
            constraintWidth(constant: width)
        }
        if let cornerRadius = cornerRadius {
            viewCornerRadius = cornerRadius
        }
        if let backgroundColor = backgroundColor {
            self.backgroundColor = backgroundColor
        }
    }
}

//MARK: - UIButton Extensions
extension UIButton {
    
    var title: String? {
        get { title(for: .normal) }
        set { setTitle(newValue, for: .normal) }
    }
    
    var attributedTitle: NSAttributedString? {
        get { attributedTitle(for: .normal) }
        set { setAttributedTitle(newValue, for: .normal) }
    }
    
    var textColor: UIColor? {
        get { self.titleColor(for: .normal) }
        set { self.setTitleColor(newValue, for: .normal) }
    }
    
    func enable(_ enable: Bool = true) {
        enableUserInteraction(enable)
        alpha = enable ? 1 : 0.7
    }
    
    var font: UIFont? {
        get { titleLabel?.font }
        set { titleLabel?.font = newValue }
    }
    
    func adjustsFontSizeToFitWidth() {
        titleLabel?.numberOfLines = 1
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
    }
}

extension UILabel {
    
    convenience init(text: String,
                     font: UIFont = .avenirRegular(16),
                     numberOfLines: Int = 1,
                     color: UIColor = .label,
                     alignment: NSTextAlignment = .center,
                     adjustsFontSizeToFitWidth: Bool = true,
                     underlined: Bool = false,
                     huggingPriority: UILayoutPriority? = nil,
                     huggingAxis: NSLayoutConstraint.Axis? = nil,
                     lineBreakMode: NSLineBreakMode = .byWordWrapping
    ) {
        self.init(frame: .zero)
        self.text = text
        self.textColor = color
        self.font = font
        self.numberOfLines = numberOfLines
        self.textAlignment = alignment
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        if underlined {
            underline()
        }
        if let huggingPriority = huggingPriority, let huggingAxis = huggingAxis {
            setContentHuggingPriority(huggingPriority, for: huggingAxis)
        }
    }
    
    convenience init(attributedText: NSAttributedString, numberOfLines: Int = 1, alignment: NSTextAlignment = .center) {
        self.init(frame: .zero)
        self.attributedText = attributedText
        self.numberOfLines = numberOfLines
        self.textAlignment = alignment
        self.adjustsFontSizeToFitWidth = true
    }
    
    func setLineHeight(spacing: CGFloat) {
        let attributedString = NSMutableAttributedString(string: self.text ?? "")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        attributedText = attributedString
    }
    
    func underline() {
        let attr: NSMutableAttributedString =  NSMutableAttributedString(string: self.text ?? "")
        attr.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attr.length))
        attributedText = attr
        
    }
}

extension UITextField {
    
    func restrictInputToDigits(string: String, allowCurrencyFormatting: Bool = false, currencySymbol: String = "") -> Bool {
        // remove non-numerics and compare with original string
        let currencyExtras = allowCurrencyFormatting ? ",\(currencySymbol)" : ""
        return string == string.filter("\(currencyExtras)0123456789".contains)
    }
    
    func restrictInputToDigits(range: NSRange, string: String, allowSpecialCharacterFormatting: Bool = false, specialCharacter: String = "", maxLength: Int? = nil) -> Bool {
        
        if let maxLength = maxLength {
            // get the current text, or use an empty string if the failed
            let currentText = text ?? ""
            
            // attempt to read the range they are trying to change, or exit if we can't
            guard let stringRange = Range(range, in: currentText) else { return false }
            
            // add their new text to the existing text
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            
            //  make sure the result is under `maxLength` characters and remove non-numerics and compare with original string
            return string == string.filter("\(specialCharacter)0123456789".contains) && updatedText.count <= maxLength
        }
        
        return string == string.filter("\(specialCharacter)0123456789".contains)
    }
    
    func restrictToDigitsWithMaximumLength(range: NSRange, string: String, maxLength: Int) -> Bool {
        // get the current text, or use an empty string if the failed
        let currentText = text ?? ""
        
        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        //  make sure the result is under `maxLength` characters and remove non-numerics and compare with original string
        return string == string.filter("0123456789".contains) && updatedText.count <= maxLength
        
    }
    
    func restrictToMaximumLength(range: NSRange, string: String, maxLength: Int) -> Bool {
        // get the current text, or use an empty string if the failed
        let currentText = text ?? ""
        
        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        //  make sure the result is under `maxLength` characters and remove non-numerics and compare with original string
        return updatedText.count <= maxLength
        
    }
    
    func setPadding(left: CGFloat? = nil, right: CGFloat? = nil) {
        if let left = left {
            leftView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: frame.size.height))
            leftViewMode = .always
        }
        if let right = right {
            rightView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: self.frame.size.height))
            rightViewMode = .always
        }
    }
}

extension UIScrollView {
    convenience init(children: [UIView], showsVerticalScrollIndicator: Bool = false, showsHorizontalScrollIndicator: Bool = false) {
        self.init(frame: .zero)
        addSubviews(children)
        self.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
    }
    
    func updateContentView(_ offset: CGFloat = 50) {
        contentSize.height = (subviews.sorted(by: { $0.frame.maxY < $1.frame.maxY }).last?.frame.maxY ?? contentSize.height) + offset
    }
    
    func showIndicators(_ show: Bool = true) {
        showsVerticalScrollIndicator = show
        showsHorizontalScrollIndicator = show
    }
    
    var _topAnchor: NSLayoutYAxisAnchor? { contentLayoutGuide.topAnchor }
    
    var _bottomAnchor: NSLayoutYAxisAnchor? { contentLayoutGuide.bottomAnchor }
    
    var _leadingAnchor: NSLayoutXAxisAnchor? { frameLayoutGuide.leadingAnchor }
    
    var _trailingAnchor: NSLayoutXAxisAnchor? { frameLayoutGuide.trailingAnchor }
}

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { addArrangedSubview($0) }
    }
    
    func removeAllArrangedSubviews() {
        subviews.forEach { removeArrangedSubview($0) }
    }
    
    func remove(subview: UIView) {
        removeArrangedSubview(subview)
        subview.removeFromSuperview()
    }
    
    func removeArrangedSubviews() {
        arrangedSubviews.forEach { (subview) in
            remove(subview: subview)
        }
    }
}
