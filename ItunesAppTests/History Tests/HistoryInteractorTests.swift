//
//  HistoryInteractorTests.swift
//  ItunesAppTests
//
//  Created by Evgeniy Uskov on 22.01.2021.
//

import XCTest
@testable import ItunesApp

class HistoryInteractorTests: XCTestCase {
    
    var interactor: HistoryInteractor?
    
    var historyViewController: HistoryViewController?
    var presenter: HistoryPresenterStub?
    var networkManager: NetworkManagerProtocol?
    var storageManager: HistoryStorageProtocol?
    var album: Album?
        
    override func setUpWithError() throws {
        networkManager = NetworkManagerStub()
        storageManager = StorageManagerStub()
        NetworkManagerStub().fetchAlbums(searchTerm: "Foo", completion: {
            albums in
            self.album = albums?[0]
        })
        presenter = HistoryPresenterStub()
        let delegate = SearchViewControllerBuilder().build()
        
        guard let presenterLocal = presenter else {return}
        guard let storageManager = storageManager else {return}
        interactor = HistoryInteractor(presenter: presenterLocal,
                                       storageManager: storageManager, transferDataDelegate: delegate)
    }
    
    override func tearDownWithError() throws {
    }
    
    public func testInteractorLoadAlbums() throws {
//        guard let album = album else {return}
        interactor?.loadHistory()
        
//        XCTAssertNotNil(presenter?.history, "No tracks received")
//        XCTAssertEqual(presenter?.tracks?.count, 5, "Wrong number of tracks received")
    }
    
}
