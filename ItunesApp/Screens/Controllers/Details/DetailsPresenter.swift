//
//  DetailsPresenter.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 17.01.2021.
//

import Foundation

public protocol DetailsPresenterProtocol: AnyObject {
    func presentDetailsViewModel(fromAlbum album: Album, tracks: [Track]?, completion: @escaping () -> ())
}

public class DetailsPresenter : DetailsPresenterProtocol {
    weak var viewController: DetailsViewControllerProtocol?
    
    public init(viewController: DetailsViewControllerProtocol) {
        self.viewController = viewController
    }
    
    public func presentDetailsViewModel(fromAlbum album: Album,
                                        tracks: [Track]?,
                                        completion: @escaping () -> ()) {
        var albumReleased: Date?
        if let releaseDate = album.releaseDate {
            albumReleased = releaseDate.toDateTime()
        }
        
        let detailsViewModel = DetailsViewModel(album: album,
                                                iconUrlString: album.artworkUrl100,
                                                previewUrl: album.collectionViewUrl,
                                                artistName: album.artistName,
                                                collectionName: album.collectionName,
                                                releaseDate: albumReleased?.toLiteralString(),
                                                primaryGenreName: album.primaryGenreName,
                                                tracks: tracks)
        
        viewController?.displayData(detailsViewModel: detailsViewModel)
        completion()
    }
    
}
