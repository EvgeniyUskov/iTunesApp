//
//  SearchPresenterTests.swift
//  ItunesAppTests
//
//  Created by Evgeniy Uskov on 22.01.2021.
//

import XCTest
@testable import ItunesApp

class SearchPresenterTests: XCTestCase {
    var interactor: SearchInteractorProtocol?
    var searchViewController: SearchViewControllerStub?
    var presenter: SearchPresenter?
    var networkManager: NetworkManagerProtocol?
    var storageManager: HistoryStorageProtocol?
        
    override func setUpWithError() throws {
        let layout = UICollectionViewFlowLayout()
        let viewModel = SearchViewModel(cells: [])
        searchViewController = SearchViewControllerStub(layout: layout, viewModel: viewModel)
        networkManager = NetworkManagerStub()
        storageManager = StorageManagerStub()
        presenter = SearchPresenter(viewController: searchViewController!)
        
        guard let presenterLocal = presenter, let networkManager = networkManager, let storageManager = storageManager else {return}
        interactor = SearchInteractorStub(presenter: presenterLocal,
                                      networkManager: networkManager,
                                      storageManager: storageManager)
    }
    
    override func tearDownWithError() throws {
    }

    func testPresentData() throws {
        interactor?.loadAlbums(searchTerm: "Foo")
        
        XCTAssertEqual(searchViewController?.viewModel.cells.count, 5, "error in albums quantity")
        XCTAssertEqual(searchViewController?.viewModel.cells[0].artistName, "Foo-0", "error getting ArtistName")
        XCTAssertEqual(searchViewController?.viewModel.cells[0].collectionName, "Bar-0")
    }

}
