//
//  Date.swift
//  GLUtils
//
//  Created by Hangyeol on 2022/07/29.
//

import Foundation

extension Date {
    
    func format(to dateFormat: String) -> Date {
        let dateString = string(to: dateFormat)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.date(from: dateString) ?? self
    }
    
    func string(to dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
}
