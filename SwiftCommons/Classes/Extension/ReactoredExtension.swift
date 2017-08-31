//
//  ReactoredExtension.swift
//  Pods
//
//  Created by Lukasz on 30/08/2017.
//
//

import Foundation
import Reactored

extension ReactorView {

    func bind(state: State, if isActive: Bool) {
        if isActive {
            bind(state: state)
        }
    }
}
