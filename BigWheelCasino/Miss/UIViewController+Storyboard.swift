//
//  UIViewController+Storyboard.swift
//  CommunitySafetyWatch
//
//  Created by ABC on 4/10/18.
//  Copyright © 2018 ABC. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
//    class func instance() -> UIViewController {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let identifier = NSStringFromClass(self).components(separatedBy: ".").last!
//        return storyboard.instantiateViewController(withIdentifier: identifier)
//    }
    
    class func instance(_ storyboard: Storyboard = .main) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let identifier = NSStringFromClass(self).components(separatedBy: ".").last!
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
    
}

enum Storyboard: String {
    case main = "Main"
    case authentication = "Authentication"
    case base = "Base"
    case tab = "Tab"
    case home = "Home"
}
