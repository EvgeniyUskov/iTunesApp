//
//  DetailInfoStackView.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 22.01.2021.
//

import UIKit

public class DetailInfoStackView: UIStackView {
    //MARK: Properties
    lazy var captionTitleLabel: UILabel = {
        return UILabel.makeCaptionLabel("Album:")
    }()
    lazy var albumTitleLabel: UILabel = {
        return UILabel.makeDetailLabel()
    }()
    
    lazy var captionArtistLabel: UILabel = {
        return UILabel.makeCaptionLabel("Artist:")
    }()
    lazy var albumArtistLabel: UILabel = {
        return UILabel.makeDetailLabel()
    }()
    
    lazy var captionDateLabel: UILabel = {
        return UILabel.makeCaptionLabel("Released in:")
    }()
    lazy var albumReleaseDateLabel: UILabel = {
        return UILabel.makeDetailLabel()
    }()
    
    lazy var captionGenreLabel: UILabel = {
        return UILabel.makeCaptionLabel("Genre:")
    }()
    lazy var albumGenreLabel: UILabel = {
        return UILabel.makeDetailLabel()
    }()
    
    //MARK: Init methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
}

//MARK: Additional methods
extension DetailInfoStackView {
    private func setupView() {
        let albumStackView = UIStackView.makeHorizontalStackView(views: [captionTitleLabel,
                                                                         albumTitleLabel])
        let artistStackView = UIStackView.makeHorizontalStackView(views: [captionArtistLabel,
                                                                          albumArtistLabel])
        let releasedStackView = UIStackView.makeHorizontalStackView(views: [captionDateLabel,
                                                                            albumReleaseDateLabel])
        let genreStackView = UIStackView.makeHorizontalStackView(views: [captionGenreLabel,
                                                                         albumGenreLabel])
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        backgroundColor = Constants.Colors.backgroundColor
        clipsToBounds = true
        
        addArrangedSubview(albumStackView)
        addArrangedSubview(artistStackView)
        addArrangedSubview(releasedStackView)
        addArrangedSubview(genreStackView)
        
    }
    
    public func configure(with viewModel: DetailsViewModel) {
        albumTitleLabel.text = viewModel.collectionName
        albumArtistLabel.text = viewModel.artistName
        albumReleaseDateLabel.text = viewModel.releaseDate
        albumGenreLabel.text = viewModel.primaryGenreName
    }
}
