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
    
    public static func bind(error: String, if isActive: Bool) {
        bind(errors: (isActive, error))
    }
    
    public static func bind(errors: (Bool, String)...) {
        if let error = errors.first(where: { $0.0 }) {
            show(error: error.1)
        } else {
            hide()
        }
    }
    
    public static func show(error: String) {
        let view = MessageView.viewFromNib(layout: .statusLine)
        view.configureTheme(.error)
        view.configureContent(body: error)
        view.id = "error"
        SwiftMessages.show(view: view)
    }
    
    public static func hide() {
        SwiftMessages.hide(id: "error")
    }
    
    

}
