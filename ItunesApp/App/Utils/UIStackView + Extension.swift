//
//  UIStackView + Extension.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 22.01.2021.
//

import UIKit

extension UIStackView {
    static func makeVerticalStackView(views: [UIView]) -> UIStackView {
        let view = UIStackView(arrangedSubviews: views)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fill
        view.backgroundColor = Constants.Colors.backgroundColor
        view.clipsToBounds = true
        return view
    }
    
    static func makeHorizontalStackView(views: [UIView]) -> UIStackView {
        let view = UIStackView(arrangedSubviews: views)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fill
        view.backgroundColor = Constants.Colors.backgroundColor
        view.clipsToBounds = true
        view.spacing = 5
        return view
    }
}
