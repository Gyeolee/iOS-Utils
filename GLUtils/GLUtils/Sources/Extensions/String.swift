//
//  String.swift
//  GLUtils
//
//  Created by Hangyeol on 2022/07/26.
//

import Foundation

extension String {
    
    var hexValue: UInt? {
        if self.starts(with: "0x") {
            return UInt(self.suffix(6), radix: 16)
        }
        
        return UInt(String("0x\(self)".suffix(6)), radix: 16)
    }
}

extension String {
    
    var youtubeVideoID: String? {
        let typePattern = "(?:(?:\\.be\\/|embed\\/|v\\/|\\?v=|\\&v=|\\/videos\\/)|(?:[\\w+]+#\\w\\/\\w(?:\\/[\\w]+)?\\/\\w\\/))([\\w-_]+)"
        let regex = try? NSRegularExpression(pattern: typePattern, options: .caseInsensitive)
        return regex
            .flatMap { $0.firstMatch(in: self, range: NSMakeRange(0, self.count)) }
            .flatMap { Range($0.range(at: 1), in: self) }
            .map { String(self[$0]) }
    }
}

extension String {
    
    var isValidEmail: Bool {
        let emailRegEx = "^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$"
        let test = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return test.evaluate(with: self)
    }
    
    func isValidPassword(minLength: Int, maxLength: Int) -> Bool {
        let passwordRegEx = ("(?=.*[A-Za-z])(?=.*[0-9]).{8,20}")
        let test = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return test.evaluate(with: self) && (count >= minLength && count <= maxLength)
    }
}
