//
//  UIApplication+Hierarchy.swift
//  CommunitySafetyWatch
//
//  Created by Vivek Patel on 18/04/20.
//  Copyright © 2020 Innovaeps. All rights reserved.
//

import Foundation
import UIKit

public extension UIApplication {
    
    // Returns current Top Most ViewController in hierarchy of Window.
    class func topMostWindowController()-> UIViewController? {
        
        var topController = UIApplication.shared.keyWindow?.rootViewController
        
        while let presentedController = topController?.presentedViewController {
            topController = presentedController
        }
        
        return topController
    }
    
    // Returns the topViewController from stack of topMostWindowController (if in navigation).
    class func currentViewController()-> UIViewController? {
        
        var currentViewController = UIApplication.topMostWindowController()
        
        while currentViewController != nil && currentViewController is UINavigationController && (currentViewController as! UINavigationController).topViewController != nil {
            currentViewController = (currentViewController as! UINavigationController).topViewController
        }
        
        return currentViewController
    }
}
