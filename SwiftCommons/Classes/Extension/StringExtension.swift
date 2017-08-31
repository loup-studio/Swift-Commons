//
//  StringExtension.swift
//  Pods
//
//  Created by Lukasz on 30/08/2017.
//
//

import Foundation

extension String {
    
    var isBlank: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var isNotBlank: Bool {
        return !isBlank
    }
    
    func digitsOnly() -> String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
}
