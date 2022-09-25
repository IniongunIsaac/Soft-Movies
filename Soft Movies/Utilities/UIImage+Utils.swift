//
//  UIImage+Utils.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation
import UIKit

extension UIImage {
    static var authIllustration: UIImage { UIImage(named: "auth_illustration") ?? UIImage() }
    
    static var eyeOpenIcon: UIImage { UIImage(named: "eye_open_icon") ?? UIImage() }
    
    static var eyeClosedIcon: UIImage { UIImage(named: "eye_closed_icon") ?? UIImage() }
    
    static var emptyIcon: UIImage { UIImage(named: "empty_icon") ?? UIImage() }
    
    static var profileIcon: UIImage { UIImage(named: "profile_icon") ?? UIImage() }
    
    static var moviePlaceholderIcon: UIImage { UIImage(named: "movie_placeholder_icon") ?? UIImage() }
}

