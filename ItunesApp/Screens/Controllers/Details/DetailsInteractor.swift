//
//  DetailsViewControllerInteractor.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 17.01.2021.
//

import Foundation

//MARK: Protocols
public protocol DetailsInteractorProtocol {
    func loadDetails(forAlbum album: Album, completion: @escaping () -> ())
}

//MARK: DetailsInteractor
public class DetailsInteractor {
    var presenter: DetailsPresenterProtocol?
    private var networkManager: NetworkManagerProtocol?
    
    //MARK: Init methods
    public init(presenter: DetailsPresenterProtocol, networkManager: NetworkManagerProtocol) {
        self.presenter = presenter
        self.networkManager = networkManager
    }
    
}

//MARK: DetailsInteractorProtocol implementation methods
extension DetailsInteractor: DetailsInteractorProtocol {
    public func loadDetails(forAlbum album: Album,
                            completion: @escaping () -> ()) {
        loadTracks(forAlbum: album,
                   completion: {
            completion()
        })
    }
    
}

//MARK: Additional methods
extension DetailsInteractor {
    public func loadTracks(forAlbum album: Album,
                           completion: @escaping () -> () ) {
        guard let collectionId = album.collectionId else {return}
        
        networkManager?.fetchTracks(collectionId: collectionId, completion: {
            [weak self]
            (tracks) in
            self?.presenter?.presentDetailsViewModel(fromAlbum: album,
                                                     tracks: tracks,
                                                     completion: {
                                                        completion()
                                                     })
        })
    }
}
