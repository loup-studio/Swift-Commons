//
//  ErrorExtension.swift
//  Pods
//
//  Created by Lukasz on 30/08/2017.
//
//

import Foundation

extension Error {
    
    var isNotConnectedToInternet: Bool {
        if let error = self as? URLError, error.code  == URLError.Code.notConnectedToInternet {
            return true
        } else {
            return false
        }
    }
}
