//
//  TableViewCell.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 20.01.2021.
//

import UIKit

class TrackCell: UITableViewCell {
    //MARK: Properties
    lazy var trackNumberLabel: UILabel = UILabel.makeTrackLabel()
    lazy var trackNameLabel: UILabel = UILabel.makeTrackLabel()
    lazy var stackView = UIStackView.makeHorizontalStackView(views: [trackNumberLabel,
                                                                trackNameLabel])
    
    //MARK: Init methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        stackView.spacing = 10
        stackView.clipsToBounds = true
        stackView.sizeToFit()
        
        addSubview(stackView)
        setupView(with: stackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Additional methods
extension TrackCell {
    private func setupView(with stackView: UIStackView) {
        backgroundColor = Constants.Colors.backgroundColor

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            contentView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 10),
            
            stackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20),
            stackView.heightAnchor.constraint(equalToConstant: 44),
            
            trackNameLabel.widthAnchor.constraint(lessThanOrEqualTo: stackView.widthAnchor, multiplier: 0.9)
        ])
    }
    
    public func configure (track: Track) {
        guard let number = track.trackNumber else { return }
        trackNumberLabel.text = String(number)
        trackNameLabel.text = track.trackName
    }

}
