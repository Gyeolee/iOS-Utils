//
//  UIView.swift
//  GLUtils
//
//  Created by Hangyeol on 2022/07/26.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let borderColor = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: borderColor)
        }
        set { layer.borderColor = newValue?.cgColor }
    }
}

extension UIView {
    
    func cornerRadius(_ radius: CGFloat, corners: CACornerMask) {
        layer.cornerRadius = radius
        layer.maskedCorners = corners
    }
    
    func cornerRadius(_ radius: CGFloat,
                      borderWith: CGFloat,
                      borderColor: UIColor,
                      shadowX: CGFloat,
                      shadowY: CGFloat,
                      shadowBlur: CGFloat,
                      shadowSpread: CGFloat,
                      shadowColor: UIColor,
                      shadowAlpha: Float) {
        layer.masksToBounds = false
        layer.cornerRadius = radius
        layer.borderWidth = borderWith
        layer.borderColor = borderColor.cgColor
        layer.shadowOffset = CGSize(width: shadowX, height: shadowY)
        layer.shadowRadius = shadowBlur / 2
        if shadowSpread == 0 {
            layer.shadowPath = nil
        } else {
            let dx = -shadowSpread
            let rect = layer.bounds.insetBy(dx: dx, dy: dx)
            layer.shadowPath = UIBezierPath(rect: rect).cgPath
        }
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowAlpha
    }
}
