//
//  Dictionary.swift
//  GLUtils
//
//  Created by Hangyeol on 2022/07/28.
//

import Foundation

extension Dictionary {
    
    var jsonString: String? {
        if self.keys.isEmpty {
            return nil
        }
        
        guard let data = try? JSONSerialization
            .data(withJSONObject: self, options: [.prettyPrinted]) else {
            return nil
        }
        return String(data: data, encoding: .utf8) ?? nil
    }
    
    var queryString: String {
        self.compactMap { key, value -> String in
            return "\(key)=\(value)"
        }.joined(separator: "&")
    }
}
