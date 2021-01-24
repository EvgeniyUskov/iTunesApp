//
//  Header.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 15.01.2021.
//

import UIKit

//MARK: ItemsHeader
public class ItemsHeader: UICollectionReusableView {
    var label: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.Colors.textColor
        label.text = Constants.Stuff.headerText
        label.font = .systemFont(ofSize: 14, weight: .thin)
        label.contentMode = .center
        return label
    }()
    
    //MARK: Init methods
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
}

//MARK: Additional methods
extension ItemsHeader {
    private func setup() {
        addSubview(label)
        
        //MARK: Contraints
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)])
    }
}
