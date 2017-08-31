//
//  StringExtension.swift
//  Pods
//
//  Created by Lukasz on 30/08/2017.
//
//

import Foundation

extension String {
    
    public var isBlank: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    public var isNotBlank: Bool {
        return !isBlank
    }
    
    public func digitsOnly() -> String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
}
