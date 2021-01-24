//
//  SearchInteractorStub.swift
//  ItunesAppTests
//
//  Created by Evgeniy Uskov on 22.01.2021.
//

import Foundation
@testable import ItunesApp
public class SearchInteractorStub {
    //MARK: Properties
    var presenter: SearchPresenterProtocol?

    private var networkManager: NetworkManagerProtocol?
    private var storageManager: HistoryStorageProtocol?
    
    //MARK: Init metods
    public init(presenter: SearchPresenterProtocol, networkManager: NetworkManagerProtocol, storageManager: HistoryStorageProtocol) {
        self.presenter = presenter
        self.networkManager = networkManager
        self.storageManager = storageManager
    }
    
}

//MARK: SearchInteractorProtocol implementation methods
extension SearchInteractorStub: SearchInteractorProtocol{
    public func loadAlbums(searchTerm: String) {
        makeRequest(searchTerm)
    }
    
    public func addSearchTermToHistory(searchTerm: String) {
        storageManager?.addSearchTermToHistory(searchTerm: searchTerm)
    }
}

// MARK: additional methods
extension SearchInteractorStub {
    private func makeRequest(_ searchTerm: String) {
        networkManager?.fetchAlbums(searchTerm: searchTerm) {
            [weak self]
            (albums) in
            self?.presenter?.presentData(albums: albums)
        }
    }
}

