//
//  UIColor.swift
//  GLUtils
//
//  Created by Hangyeol on 2022/07/26.
//

import UIKit

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1.0) {
        self.init(
            red: r / 255,
            green: g / 255,
            blue: b / 255,
            alpha: a
        )
    }
    
    convenience init(rgb: UInt, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: a
        )
    }
}
