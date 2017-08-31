//
//  TaskHelper.swift
//  Pods
//
//  Created by Lukasz on 30/08/2017.
//
//

import UIKit
import SVProgressHUD
import Alertift

public struct TaskHelper {
    
    private init() {}
    
    public static func bind(tasks: Task<Any>...) -> Bool {
        let activeTasks = tasks.filter { $0 != .idle }
        guard activeTasks.isNotEmpty else { return false }
        guard activeTasks.count == 1 else { fatalError("cannot bind multiple active tasks") }
        
        return bind(task: activeTasks.first!)
    }
    
    public static func bind<T>(task: Task<T>) -> Bool {
        switch task {
        case .idle: return false
        case .running(let progress):
            if progress > 0 {
                SVProgressHUD.showProgress(Float(progress) / 100)
            } else {
                SVProgressHUD.show()
            }
            return true
        case .successful:
            SVProgressHUD.dismiss()
            return false
        case .failure(let message):
            SVProgressHUD.dismiss()
            Alertift.alert(title: nil, message: message.isNotBlank ? message : TaskConfiguration.genericFailureMessage)
                .action(.default(TaskConfiguration.failureAlertDismissButton))
                .show()
            return false
        }
    }
    
}

