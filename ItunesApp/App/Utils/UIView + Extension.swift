//
//  UIView + Extension.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 17.01.2021.
//

import UIKit

public extension UIView {
    
    class func loadFromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    func pin(to superview: UIView) {
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            self.topAnchor.constraint(equalTo: superview.topAnchor),
            superview.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            superview.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func pin(to superview: UIView, withPadding padding: CGFloat) {
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: padding),
            self.topAnchor.constraint(equalTo: superview.topAnchor, constant: padding),
            superview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: padding),
            superview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: padding)
        ])
    }
}
