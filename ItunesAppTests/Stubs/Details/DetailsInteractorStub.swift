//
//  DetailsInteractorStub.swift
//  ItunesAppTests
//
//  Created by Evgeniy Uskov on 22.01.2021.
//

import Foundation


import Foundation
@testable import ItunesApp

//MARK: DetailsInteractor
public class DetailsInteractorStub {
    var presenter: DetailsPresenterProtocol?
    var networkManager: NetworkManagerProtocol?
    
    //MARK: Init methods
    public init(presenter: DetailsPresenterProtocol, networkManager: NetworkManagerProtocol) {
        self.presenter = presenter
        self.networkManager = networkManager
    }
}

//MARK: DetailsInteractorProtocol implementation methods
extension DetailsInteractorStub: DetailsInteractorProtocol {
    public func loadDetails(forAlbum album: Album, completion: @escaping () -> ()) {
        loadTracks(forAlbum: album, completion: {})
    }
}

//MARK: Additional methods
extension DetailsInteractorStub {
    public func loadTracks(forAlbum album: Album, completion: @escaping () -> ()) {
        guard let collectionId = album.collectionId else {return}
        
        networkManager?.fetchTracks(collectionId: collectionId, completion: {
            [weak self]
            (tracks) in
            self?.presenter?.presentDetailsViewModel(fromAlbum: album,
                                                     tracks: tracks, completion: {})
            completion()
        })
    }
}
