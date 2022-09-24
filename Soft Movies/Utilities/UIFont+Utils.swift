//
//  UIFont+Utils.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation
import UIKit

extension UIFont {
    class func avenirExtraBold(_ size: CGFloat = 14) -> UIFont { UIFont(name: "Avenir-Black", size: size) ?? UIFont.systemFont(ofSize: size) }
    
    class func avenirBold(_ size: CGFloat = 14) -> UIFont { UIFont(name: "Avenir-Heavy", size: size) ?? UIFont.systemFont(ofSize: size) }
    
    class func avenirRegular(_ size: CGFloat = 14) -> UIFont { UIFont(name: "Avenir-Roman", size: size) ?? UIFont.systemFont(ofSize: size) }
}
