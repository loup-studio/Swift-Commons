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
    
    var visibleRegion: UIView! {
        didSet {
            setupConstraints()
        }
    }
    
    private(set) var disposeBag: DisposeBag! = DisposeBag()
    
    required public init() {
        super.init(frame: CGRect.zero)
        setupUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func tearDown() {
        disposeBag = nil
    }
}
