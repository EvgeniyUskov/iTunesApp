//
//  AlbumCell.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 17.01.2021.
//

import Kingfisher
import UIKit

//MARK: AlbumCell
public class AlbumCell: UICollectionViewCell {
    
    // MARK: Properties
    lazy var albumImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var albumTitleLabel = UILabel.makeAlbumTitleLabel()
    lazy var albumArtistLabel = UILabel.makeAlbumDataLabel()
    lazy var albumRealeasedDateLabel = UILabel.makeAlbumDataLabel()
    
    lazy var stackView = UIStackView.makeVerticalStackView(views: [albumTitleLabel,
                                                                   albumArtistLabel,
                                                                   albumRealeasedDateLabel
                                                            ])
    
    private var cell: CellViewModel?
    
    //MARK: Init methods
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        albumImageView.image = nil
    }
}

extension AlbumCell {
    private func setupView() {
        stackView.spacing = 3
        stackView.backgroundColor = .none
        addSubview(albumImageView)
        addSubview(stackView)
        
        //MARK: Contraints
        albumImageView.pin(to: contentView)
        
        NSLayoutConstraint.activate([
            albumImageView.widthAnchor.constraint(equalTo: albumImageView.heightAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            contentView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 5),
            contentView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5),
        ])
    }
    
    public func configure(with viewModel: CellViewModel) {
        cell = viewModel
        albumTitleLabel.text = viewModel.collectionName
        albumArtistLabel.text = viewModel.artistName
        albumRealeasedDateLabel.text = viewModel.releaseDate
        guard let url = URL(string: viewModel.iconUrlString ?? "") else { return }
        
        albumImageView.kf.indicatorType = .activity
        albumImageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "DefaultCover"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
}
