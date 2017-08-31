//
//  NotificationHelper.swift
//  Pods
//
//  Created by Lukasz on 31/08/2017.
//
//

import Foundation
import SwiftMessages

public struct NotificationHelper {
    
    private init() {}
    
    static func bind(error: String, if isActive: Bool) {
        bind(errors: (isActive, error))
    }
    
    static func bind(errors: (Bool, String)...) {
        if let error = errors.first(where: { $0.0 }) {
            show(error: error.1)
        } else {
            hide()
        }
    }
    
    static func show(error: String) {
        let view = MessageView.viewFromNib(layout: .StatusLine)
        view.configureTheme(.error)
        view.configureContent(body: error)
        view.id = "error"
        SwiftMessages.show(view: view)
    }
    
    static func hide() {
        SwiftMessages.hide(id: "error")
    }
    
    

}
