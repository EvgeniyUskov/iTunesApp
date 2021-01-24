//
//  SearchInteractorTests.swift
//  ItunesAppTests
//
//  Created by Evgeniy Uskov on 22.01.2021.
//

import XCTest
@testable import ItunesApp

class SearchInteractorTests: XCTestCase {
    
    var interactor: SearchInteractor?
    var presenter: SearchPresenterStub?
    var networkManager: NetworkManagerProtocol?
    var storageManager: HistoryStorageProtocol?
        
    override func setUpWithError() throws {
        networkManager = NetworkManagerStub()
        storageManager = StorageManagerStub()
        presenter = SearchPresenterStub()
        
        guard let presenterLocal = presenter, let networkManager = networkManager, let storageManager = storageManager else {return}
        interactor = SearchInteractor(presenter: presenterLocal,
                                      networkManager: networkManager,
                                      storageManager: storageManager)
    }
    
    override func tearDownWithError() throws {
    }
    
    public func testInteractorLoadAlbums() throws {
        interactor?.loadAlbums(searchTerm: "Foo")
        
        XCTAssertNotNil(presenter?.albums, "No albums received")
        XCTAssertEqual(presenter?.albums?.count, 5, "Wrong number of albums received")
    
    }
    
    public func testAddToSearchHistory() throws {
        interactor?.addSearchTermToHistory(searchTerm: "Foo")
        var history = [HistoryItem]()
        
        storageManager?.loadHistory(completionHandler: {
            historyItems in
            history = historyItems
        })
        
        XCTAssertEqual(history.count, 6, "wrong history items quantity")
        XCTAssertEqual(history[history.count-1].searchText, "Foo", "Wrong last search text")
    }
    
}
