//
//  Utils.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 24/09/2022.
//

import Foundation
import UIKit

typealias NoParamHandler = (() -> Void)

func generateHapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle = .light) {
    UIImpactFeedbackGenerator(style: style).impactOccurred()
}

var notchHeight: CGFloat { UIApplication.shared.statusBarFrame.height }

extension NSObject {
    /// Returns class name stripped from module name.
    class var className: String {
        let namespaceClassName = String(describing: self)
        return namespaceClassName.components(separatedBy: ".").last!
    }
}

extension Decodable {
    ///Maps JSON String to actual Decodable Object
    ///throws an exception if mapping fails
    static func mapFrom(jsonString: String) throws -> Self? {
        
        let decoder = JSONDecoder()
        //decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(Self.self, from: Data(jsonString.utf8))
    }
}

func _print(_ message: Any, _ messageType: ToastType = .error, isJsonResponse: Bool = false) {
    #if DEBUG
    switch messageType {
    case .error:
        print("🔴🔴🔴 " + String(describing: message))
    case .success:
        if isJsonResponse {
            print("Request Response: 🟢 🟢 🟢 🟢 🟢 🟢 🟢 🟢 🟢 🟢 🟢 🟢 🟢 🟢 🟢 🟢 🟢 🟢 🟢 🟢 🟢")
            print(message)
        } else {
            print("🟢🟢🟢 " + String(describing: message))
        }
    }
    #endif
}

func _animate(duration: TimeInterval = 0.5, completion: (() -> Void)? = nil) {
    UIView.animate(withDuration: duration, animations: {
        completion?()
    })
}
