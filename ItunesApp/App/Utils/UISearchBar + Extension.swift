//
//  UISearchBar + Extension.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 21.01.2021.
//

import UIKit

extension UISearchBar {
    public var textField: UITextField? {
        if #available(iOS 13, *) {
            return searchTextField
        }
        let subViews = subviews.flatMap{ $0.subviews }
        guard let textField = (subViews.filter { $0 is UITextField }).first as? UITextField else {return nil}
        return textField
    }
}
