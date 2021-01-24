//
//  InfoCell.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 22.01.2021.
//

import UIKit

public class InfoCell: UITableViewCell {
    //MARK: Properties
    lazy var dragDownImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = Constants.Stuff.dragDownImage
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    lazy var albumImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var detailsView = DetailInfoStackView()
    
    lazy var imageAndInfoStackView = UIStackView.makeHorizontalStackView(views: [albumImageView,
                                                                                detailsView])
    
    lazy var cellStackView = UIStackView.makeVerticalStackView(views: [dragDownImageView,
                                                                        imageAndInfoStackView])
    //MARK: Init methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        imageAndInfoStackView.spacing = 10
        
        addSubview(cellStackView)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension InfoCell {
    private func setupView() {
        backgroundColor = Constants.Colors.backgroundColor
        cellStackView.pin(to: contentView, withPadding: 10)
        
        NSLayoutConstraint.activate([
            dragDownImageView.heightAnchor.constraint(equalToConstant: 12),
            dragDownImageView.widthAnchor.constraint(equalTo: cellStackView.widthAnchor),
            
            albumImageView.heightAnchor.constraint(equalToConstant: 120),
            albumImageView.widthAnchor.constraint(equalToConstant: 120),
            
            cellStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20),
        ])
    }
    
    func configure(with viewModel: DetailsViewModel) {
        detailsView.configure(with: viewModel)
        configureImageView(with: viewModel)
    }
  
    private func configureImageView(with viewModel: DetailsViewModel) {
        let string300 = viewModel.iconUrlString?.replacingOccurrences(of: "100x100", with: "300x300")
        guard let url = URL(string: string300 ?? "") else { return }
        albumImageView.kf.indicatorType = .activity
        albumImageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "Album Cover"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
    
    
}
