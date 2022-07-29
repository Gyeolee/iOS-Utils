//
//  Int.swift
//  GLUtils
//
//  Created by Hangyeol on 2022/07/28.
//

import Foundation

extension Int {
    
    var comma: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self)) ?? String(self)
    }
}
