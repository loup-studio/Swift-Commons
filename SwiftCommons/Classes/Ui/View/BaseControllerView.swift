//
//  BaseControllerView.swift
//  Pods
//
//  Created by Lukasz on 31/08/2017.
//
//

import UIKit
import RxSwift
import Keyboardy

open class BaseControllerView: UIView, KeyboardStateDelegate {
    
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
    
    
    // KeyboardStateDelegate
    
    open func keyboardWillTransition(_ state: KeyboardState) {
        
    }
    
    public func keyboardTransitionAnimation(_ state: KeyboardState) {
        layoutIfNeeded()
    }
    
    public func keyboardDidTransition(_ state: KeyboardState) {
        
    }
}
