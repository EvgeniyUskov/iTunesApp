//
//  DetailsInteractorTests.swift
//  ItunesAppTests
//
//  Created by Evgeniy Uskov on 22.01.2021.
//

import XCTest
@testable import ItunesApp

class DetailsInteractorTests: XCTestCase {
    
    var interactor: DetailsInteractor?
    
    var DetailsViewController: DetailsViewController?
    var presenter: DetailsPresenterStub?
    var networkManager: NetworkManagerProtocol?
    var storageManager: HistoryStorageProtocol?
    var album: Album?
        
    override func setUpWithError() throws {
        networkManager = NetworkManagerStub()
        NetworkManagerStub().fetchAlbums(searchTerm: "Foo", completion: {
            albums in
            self.album = albums?[0]
        })
        presenter = DetailsPresenterStub()
        guard let presenterLocal = presenter, let networkManager = networkManager else {return}
        interactor = DetailsInteractor(presenter: presenterLocal,
                                      networkManager: networkManager)
    }
    
    override func tearDownWithError() throws {
    }
    
    public func testInteractorLoadAlbums() throws {
        guard let album = album else {return}
        interactor?.loadTracks(forAlbum: album, completion: {
            [weak self] in
            XCTAssertNotNil(self?.presenter?.tracks, "No tracks received")
            XCTAssertEqual(self?.presenter?.tracks?.count, 5, "Wrong number of tracks received")
        })
    }
    
}
