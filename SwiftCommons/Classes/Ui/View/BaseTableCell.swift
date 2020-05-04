//
//  BaseCell.swift
//  Smartreno Pro
//
//  Created by Lukasz on 09/07/2017.
//  Copyright © 2017 Smart Reno. All rights reserved.
//

import UIKit

open class BaseTableCell : UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    
}
