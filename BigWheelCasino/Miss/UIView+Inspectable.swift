//
//  UIApplication+Hierarchy.swift
//  CommunitySafetyWatch
//
//  Created by Vivek Patel on 18/04/20.
//  Copyright © 2020 Innovaeps. All rights reserved.
//
import UIKit

@IBDesignable class ViewShadow: UIView {
    var shadowAdded: Bool = false
    
    /*
     @IBInspectable var cornerRadiusShadow: CGFloat = 0 {
     didSet {
     layer.cornerRadius = cornerRadius
     layer.masksToBounds = cornerRadius > 0
     }
     }
     */
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if shadowAdded { return }
        shadowAdded = true
        
        let shadowLayer = UIView(frame: self.frame)
        shadowLayer.backgroundColor = UIColor.clear
        shadowLayer.layer.shadowColor = UIColor.black.cgColor
        shadowLayer.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
        shadowLayer.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        shadowLayer.layer.shadowOpacity = 0.2
        shadowLayer.layer.shadowRadius = 2
        shadowLayer.layer.masksToBounds = true
        shadowLayer.clipsToBounds = false
        
        self.superview?.addSubview(shadowLayer)
        self.superview?.bringSubviewToFront(self)
    }
}

@IBDesignable
class DesignableImageView: UIImageView {
}

@IBDesignable
class DesignableButton: UIButton {
}

@IBDesignable
class DesignableLabel: UILabel {
}
@IBDesignable
class DesignableView: UIView {
}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
}
@IBDesignable class DottedVertical: UIView {
    
    
    @IBInspectable var dotColor: UIColor = UIColor.lightGray
    @IBInspectable var lowerHalfOnly: Bool = false
    
    override func draw(_ rect: CGRect) {
        
        // say you want 8 dots, with perfect fenceposting:
        let totalCount = 8 + 8 - 1
        let fullHeight = bounds.size.height
        let width = bounds.size.width
        let itemLength = fullHeight / CGFloat(totalCount)
        
        let path = UIBezierPath()
        let beginFromTop = CGFloat(0.0)
        let top = CGPoint(x: width/2, y: beginFromTop)
        let bottom = CGPoint(x: width/2, y: fullHeight)
        
        path.move(to: top)
        path.addLine(to: bottom)
        path.lineWidth = width
        
        let dashes: [CGFloat] = [itemLength, itemLength]
        path.setLineDash(dashes, count: dashes.count, phase: 0)
        
        dotColor.setStroke()
        path.stroke()
    }
}

@IBDesignable class DottedHoritontal: UIView {
    
    @IBInspectable var dotColor: UIColor = UIColor.lightGray
    @IBInspectable var lowerHalfOnly: Bool = false
    
    override func draw(_ rect: CGRect) {
        
        // say you want 8 dots, with perfect fenceposting:
        var totalCount = 5 + 5 - 1
        let fullHeight = bounds.size.height
        let width = bounds.size.width
        
        totalCount = Int((bounds.size.width)/5)
        let itemLength = width / CGFloat(totalCount)
        
        let path = UIBezierPath()
        let beginFromLeft = CGFloat(0.0)
        let left = CGPoint(x:beginFromLeft , y: fullHeight/2)
        let right = CGPoint(x: width , y: fullHeight/2)
        
        path.move(to: left)
        path.addLine(to: right)
        path.lineWidth = fullHeight
        
        let dashes: [CGFloat] = [itemLength, itemLength]
        path.setLineDash(dashes, count: dashes.count, phase: 0)
        
        dotColor.setStroke()
        path.stroke()
    }
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
