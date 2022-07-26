//
//  UILabel.swift
//  GLUtils
//
//  Created by Hangyeol on 2022/07/26.
//

import UIKit

extension UILabel {
    
    func attributedText(_ string: String,
                        attributedStringKey: NSAttributedString.Key,
                        value: Any,
                        rangeString: String) {
        let attributedString = NSMutableAttributedString(string: string)
        let range = (string as NSString).range(of: rangeString)
        attributedString.addAttribute(attributedStringKey, value: value, range: range)
        attributedText = attributedString
    }
    
    func attributedText(_ string: String,
                        attributes: [NSAttributedString.Key: Any],
                        rangeString: String) {
        let attributedString = NSMutableAttributedString(string: string)
        let range = (string as NSString).range(of: rangeString)
        attributes.forEach { key, value in
            attributedString.addAttribute(key, value: value, range: range)
        }
        attributedText = attributedString
    }
    
    func underline(_ string: String, value: Int = 1) {
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(
            NSAttributedString.Key.underlineStyle,
            value: value,
            range: NSRange(location: 0, length: attributedString.length)
        )
        attributedText = attributedString
    }
    
    func strikeThrough(_ string: String, value: Int = 1) {
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
            value: value,
            range: NSRange(location: 0, length: attributedString.length)
        )
        attributedText = attributedString
    }
    
    func scalableBulleted(strings: [String],
                          bullet: String = "•  ",
                          lineSpacing: CGFloat = 0) {
        let strings = strings.map { bullet + $0 }
        
        let fontMetrict = UIFontMetrics(forTextStyle: .caption2)
        font = fontMetrict.scaledFont(for: font)
        
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.font] = font
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.headIndent = (bullet as NSString).size(withAttributes: attributes).width
        paragraphStyle.lineSpacing = lineSpacing
        attributes[.paragraphStyle] = paragraphStyle
        
        let string = strings.joined(separator: "\n")
        attributedText = NSAttributedString(string: string, attributes: attributes)
    }
}
