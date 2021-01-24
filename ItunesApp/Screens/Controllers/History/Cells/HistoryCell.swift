//
//  HistoryTableViewCell.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 19.01.2021.
//

import UIKit

class HistoryCell: UITableViewCell {
    //MARK: Properties
    lazy var label = UILabel.makeHistoryLabel()
    
    //MARK: Init methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

//MARK: Additional methods
extension HistoryCell {
    private func setupView() {
        addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            contentView.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: 20),
            
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            contentView.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: 5)
        ])
    }
    
    public func configure(with viewModel: HistoryCellViewModel) {
        backgroundColor = Constants.Colors.backgroundColor
        label.text = viewModel.searchText
    }
}
