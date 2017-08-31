//
//  BaseView.swift
//  Smartreno Pro
//
//  Created by Lukasz on 08/07/2017.
//  Copyright © 2017 Smart Reno. All rights reserved.
//

import UIKit

open class BaseView: UIView {
    
    required public init() {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
