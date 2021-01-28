//
//  UICollectionView + Extension.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 28.01.2021.
//


import UIKit
import TinyConstraints

extension UICollectionView {
    func setEmptyView(title: String, message: String) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        emptyView.backgroundColor = Constants.Colors.backgroundColor
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = Constants.Colors.textColor
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        titleLabel.text = title
        
        let messageLabel = UILabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.textColor = Constants.Colors.textColor
        messageLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center

        let stackView = UIStackView.makeVerticalStackView(views: [titleLabel,
                                                                  messageLabel])
        stackView.spacing = 5
        
        emptyView.addSubview(stackView)

        stackView.top(to: emptyView, offset: 100)
        stackView.centerX(to: emptyView)
        self.backgroundView = emptyView
    }
    func restore() {
        self.backgroundView = nil
    }
}
