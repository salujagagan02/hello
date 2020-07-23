//
//  Font.swift
//  TawasolMap
//
//  Created by mac on 06/11/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {

    static func OxaniumBold(_ size : CGFloat) -> UIFont{
        let font : UIFont? = UIFont(name: "Oxanium-Bold", size: size)!
        return (font != nil) ? font! : UIFont.systemFont(ofSize : size)
    }
    
    static func OxaniumExtraBold(_ size : CGFloat) -> UIFont{
        let font : UIFont? = UIFont(name: "Oxanium-ExtraBold", size: size)!
        return (font != nil) ? font! : UIFont.systemFont(ofSize : size)
    }
    static func OxaniumExtraLight(_ size : CGFloat) -> UIFont{
        let font : UIFont? = UIFont(name: "Oxanium-ExtraLight", size: size)!
        return (font != nil) ? font! : UIFont.systemFont(ofSize : size)
    }
    static func OxaniumLight(_ size : CGFloat) -> UIFont{
        let font : UIFont? = UIFont(name: "Oxanium-Light", size: size)!
        return (font != nil) ? font! : UIFont.systemFont(ofSize : size)
    }
    static func OxaniumMedium(_ size : CGFloat) -> UIFont{
        let font : UIFont? = UIFont(name: "Oxanium-Medium", size: size)!
        return (font != nil) ? font! : UIFont.systemFont(ofSize : size)
    }
    
    static func OxaniumRegular(_ size : CGFloat) -> UIFont{
        let font : UIFont? = UIFont(name: "Oxanium-Regular", size: size)!
        return (font != nil) ? font! : UIFont.systemFont(ofSize : size)
    }
    
    static func OxaniumSemiBold(_ size : CGFloat) -> UIFont{
        let font : UIFont? = UIFont(name: "Oxanium-SemiBold", size: size)!
        return (font != nil) ? font! : UIFont.systemFont(ofSize : size)
    }
    
    static func PacificoRegular(_ size : CGFloat) -> UIFont{
        let font : UIFont? = UIFont(name: "Pacifico-Regular", size: size)!
        return (font != nil) ? font! : UIFont.systemFont(ofSize : size)
    }
}
