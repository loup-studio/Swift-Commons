//
//  BaseControllerView.swift
//  Pods
//
//  Created by Lukasz on 31/08/2017.
//
//

import UIKit
import RxSwift

open class BaseControllerView: UIView {
    
    public var visibleRegion: UIView! {
        didSet {
            setupConstraints()
        }
    }
    
    public private(set) var disposeBag: DisposeBag! = DisposeBag()
    
    required public init() {
        super.init(frame: CGRect.zero)
        setupUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    open func tearDown() {
        disposeBag = nil
    }
}
