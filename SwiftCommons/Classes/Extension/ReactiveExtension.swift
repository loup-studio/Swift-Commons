//
//  ReactiveExtension.swift
//  Pods
//
//  Created by Lukasz on 30/08/2017.
//
//

import Foundation
import RxSwift
import Moya
import ObjectMapper

extension ObservableType {
    
    public static func error(message: String) -> Observable<E> {
        return Observable.error(AppError.generic(message: message))
    }
    
    
    public func asTask<T>(name: String = "", errorMessage: String = "") -> Observable<Task<T>> where Self.E == T {
        return self
            .map { Task.successful(result: $0) }
            .startWith(Task.running(progress: 0))
            .catchError { error in
                print("task failure: \(error)")
                return Observable<Task<T>>.just(Task<T>.from(error: error, defaultMessage: errorMessage))
            }
            .do(onNext: { print("\(name.isNotBlank ? name + " " : "")task: \($0)") })
    }
}


// Moya

extension ObservableType where Self.E == Response {
    
    public func parse<E:BaseMappable>(toJson type: E.Type) -> Observable<E> {
        return self.map { response in
            guard let json = Mapper<E>().map(JSONString: (try? response.mapString()) ?? "") else {
                throw AppError.generic(message: "json parse failure")
            }
            return json
        }
    }
    
    public func parse<E:BaseMappable>(toJsonArrayOf: E.Type) -> Observable<[E]> {
        return self.map { response in
            guard let json = Mapper<E>().mapArray(JSONString: (try? response.mapString()) ?? "") else {
                throw AppError.generic(message: "json parse failure")
            }
            return json
        }
    }
}

extension PrimitiveSequence where Element == Response {
    
    public func normalize() -> Observable<Response> {
        return self
            .asObservable()
            .filterSuccessfulStatusCodes()
    }
}
