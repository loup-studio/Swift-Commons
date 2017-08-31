//
//  CollectionExtension.swift
//  Pods
//
//  Created by Lukasz on 30/08/2017.
//
//

import Foundation

extension Collection where Iterator.Element: Any {
    
    public var isNotEmpty: Bool {
        return !isEmpty
    }
}
