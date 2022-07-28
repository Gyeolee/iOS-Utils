//
//  Codable.swift
//  GLUtils
//
//  Created by Hangyeol on 2022/07/28.
//

import Foundation

extension Encodable {
    
    var encodedArray: [Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        
        let jsonObject = try? JSONSerialization.jsonObject(
            with: data,
            options: .allowFragments
        )
        
        return jsonObject.flatMap {
            $0 as? [Any]
        }
    }
    
    var encodedDictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        
        let jsonObject = try? JSONSerialization.jsonObject(
            with: data,
            options: .allowFragments
        )
        
        return jsonObject.flatMap {
            $0 as? [String: Any]
        }
    }
}