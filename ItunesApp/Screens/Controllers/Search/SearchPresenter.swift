//
//  SearchPresenter.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 16.01.2021.
//

import UIKit

//MARK: Protocols
public protocol SearchPresenterProtocol: AnyObject {
    func presentData(albums: [Album]?)
}

//MARK: SearchPresenter
public class SearchPresenter {
    //MARK: Properties
    weak var viewController: SearchViewControllerProtocol?
    
    //MARK: Init methods
    public init(viewController: SearchViewControllerProtocol) {
        self.viewController = viewController
    }
}

//MARK: SearchPresenterProtocol Implementation methods
extension SearchPresenter: SearchPresenterProtocol {
    
    public func presentData(albums: [Album]?) {
        let cells = albums?.sorted().map({ generateCellViewModel(from: $0) }) ?? []
        let searchViewModel = SearchViewModel(cells: cells)
        viewController?.displayData(searchViewModel: searchViewModel)
    }
    
}

//MARK: Additional methods
extension SearchPresenter {
    
    private func generateCellViewModel(from album: Album) -> CellViewModel {
        
        var albumReleased: Date?
        if let releaseDate = album.releaseDate {
            albumReleased = releaseDate.toDateTime()
        }
        
        return CellViewModel(album: album,
                             iconUrlString: album.artworkUrl100,
                             previewUrl: album.collectionViewUrl,
                             artistName: album.artistName,
                             collectionName: album.collectionName,
                             releaseDate: albumReleased?.toYearString(),
                             primaryGenreName: album.primaryGenreName)
    }
}
