//
//  ViewExtension.swift
//  Pods
//
//  Created by Lukasz on 30/08/2017.
//
//

import UIKit

extension UIView {
    
    open func setup() {
        setupUI()
        setupConstraints()
    }
    
    @objc open func setupUI() { }
    
    @objc open func setupConstraints() { }
}

extension UITextField {
    
    public var horizontalPadding: Int {
        get { fatalError() }
        set {
            let padding = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: 0))
            
            self.leftView = padding
            self.leftViewMode = .always
            
            self.rightView = padding
            self.rightViewMode = .always
        }
    }
}

extension UIColor {
    
    convenience init(rgb: UInt, alpha: Float = 1) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha))
    }
}
