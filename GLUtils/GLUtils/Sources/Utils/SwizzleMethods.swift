//
//  SwizzleMethods.swift
//  GLUtils
//
//  Created by Hangyeol on 2022/07/26.
//

import Foundation

extension NSString {
    
    public class func swizzleReplacingCharacters() {
        let originalMethod = class_getInstanceMethod(
            NSString.self,
            #selector(NSString.replacingCharacters(in:with:))
        )
        
        let swizzledMethod = class_getInstanceMethod(
            NSString.self,
            #selector(NSString.swizzleReplacingCharacters(in:with:))
        )
        
        guard let original = originalMethod, let swizzled = swizzledMethod else {
            return
        }
        
        method_exchangeImplementations(original, swizzled)
    }
    
    @objc func swizzleReplacingCharacters(in range: NSRange, with replacement: String) -> String {
        return self.swizzleReplacingCharacters(in: range, with: replacement)
    }
}

