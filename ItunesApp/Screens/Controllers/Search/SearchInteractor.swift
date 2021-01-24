//
//  SearchInteractor.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 16.01.2021.
//


import UIKit

//MARK: Protocols
public protocol SearchInteractorProtocol {
    func loadAlbums(searchTerm: String)
    func addSearchTermToHistory(searchTerm: String)
}

public class SearchInteractor {
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
extension SearchInteractor: SearchInteractorProtocol{
    public func loadAlbums(searchTerm: String) {
        makeRequest(searchTerm)
    }
    
    public func addSearchTermToHistory(searchTerm: String) {
        storageManager?.addSearchTermToHistory(searchTerm: searchTerm)
    }
}

// MARK: additional methods
extension SearchInteractor {
    private func makeRequest(_ searchTerm: String) {
        networkManager?.fetchAlbums(searchTerm: searchTerm) {
            [weak self]
            (albums) in
            self?.presenter?.presentData(albums: albums)
        }
    }
}
