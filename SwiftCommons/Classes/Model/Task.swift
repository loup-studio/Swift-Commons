//
//  Task.swift
//  Pods
//
//  Created by Lukasz on 30/08/2017.
//
//

import Foundation
import Moya
import RxSwift

public enum Task<T> {
    case idle
    case running(progress: Int)
    case successful(result: T)
    case failure(message: String)
    
    var isSuccessful: Bool {
        if case .successful(_) = self {
            return true
        } else {
            return false
        }
    }
    
    var isFailure: Bool {
        if case .failure(_) = self {
            return true
        } else {
            return false
        }
    }
    
    var isRunning: Bool {
        if case .running(_) = self {
            return true
        } else {
            return false
        }
    }
}

extension Task {
    
    mutating func resetOnTermination() {
        switch self {
        case .successful(_): self = .idle
        case .failure(_): self = .idle
        default: ()
        }
    }
    
    static func from<T>(error: Swift.Error, defaultMessage: String) -> Task<T> {
        if let apiHandler = TaskConfiguration.apiHandler,
            let moya = error as? MoyaError,
            let response = moya.response,
            let message = apiHandler(response) {
            return Task<T>.failure(message: message)
        } else if error.isNotConnectedToInternet {
            return Task<T>.failure(message: TaskConfiguration.notConnectedToInternetFailureMessage)
        } else {
            return Task<T>.failure(message: TaskConfiguration.genericFailureMessage)
        }
    }
}

public struct TaskConfiguration {
    static var apiHandler: ((Moya.Response) -> String?)?
    static var genericFailureMessage = ""
    static var notConnectedToInternetFailureMessage = ""
    static var failureAlertDismissButton = "OK"
}

extension Task: Equatable {}
public func ==<T>(lhs: Task<T>, rhs: Task<T>) -> Bool {
    switch (lhs, rhs) {
        
    case (.idle, .idle):
        return true
        
    case (.running(let lhsProgress), .running(let rhsProgress)):
        return lhsProgress == rhsProgress
        
    case (.successful(_), .successful(_)):
        return true
        
    case (.failure(let lhsMessage), .failure(let rhsMessage)):
        return lhsMessage == rhsMessage
        
    default:
        return false
    }
}

