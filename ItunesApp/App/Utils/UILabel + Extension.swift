//
//  UILabel + Extension.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 22.01.2021.
//

import UIKit

extension UILabel {
    
    static func makeAlbumTitleLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textColor = Constants.Colors.coverTextColor
        return label
    }
    
    static func makeAlbumDataLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.textColor = Constants.Colors.coverTextColor
        return label
    }
    
    static func makeCaptionLabel(_ caption: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = caption
        label.setContentHuggingPriority(UILayoutPriority.init(251), for: .horizontal)
        label.setContentHuggingPriority(UILayoutPriority.init(251), for: .vertical)
        label.setContentCompressionResistancePriority(UILayoutPriority.init(751), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority.init(750), for: .vertical)
        
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textColor = .darkGray
        return label
    }
    
    static func makeDetailLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.setContentHuggingPriority(UILayoutPriority.init(250), for: .horizontal)
        label.setContentHuggingPriority(UILayoutPriority.init(251), for: .vertical)
        label.setContentCompressionResistancePriority(UILayoutPriority.init(750), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority.init(750), for: .vertical)
        label.lineBreakMode = NSLineBreakMode.byTruncatingTail
        
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textColor = .systemGray
        return label
    }
    
    static func makeTrackLabel() -> UILabel{
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.clipsToBounds = true
        label.lineBreakMode = NSLineBreakMode.byTruncatingTail
        label.setContentHuggingPriority(UILayoutPriority.init(250), for: .horizontal)
        label.setContentHuggingPriority(UILayoutPriority.init(251), for: .vertical)
        label.setContentCompressionResistancePriority(UILayoutPriority.init(750), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority.init(750), for: .vertical)
        
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textColor = Constants.Colors.textColor
        return label
    }
    
    static func makeHistoryLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .center
        label.numberOfLines = 1
        
        label.textColor = Constants.Colors.textColor
        label.font = .systemFont(ofSize: 17, weight: .light)
        return label
    }
}
