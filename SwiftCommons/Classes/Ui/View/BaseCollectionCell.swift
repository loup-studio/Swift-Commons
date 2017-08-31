//
//  BaseCollectionCell.swift
//  Smartreno Pro
//
//  Created by Lukasz on 12/07/2017.
//  Copyright © 2017 Smart Reno. All rights reserved.
//

import UIKit

open class BaseCollectionCell : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    
}
