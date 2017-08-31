//
//  BaseController.swift
//  Pods
//
//  Created by Lukasz on 31/08/2017.
//
//

import UIKit
import Reactored
import Mortar
import Keyboardy

open class BaseController<R: Reactor, V: BaseControllerView>: ReactorController<R> where V == R.View {
    
    var contentView: V { return view as! V }
    
    required public init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        if let view = view as? R.View {
            view.tearDown()
        }
    }
    
    override open func loadView() {
        view = V()
    }
    
    open func setup() {
        
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        contentView.visibleRegion = m_visibleRegion
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerForKeyboardNotifications(contentView)
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unregisterFromKeyboardNotifications()
    }
}
