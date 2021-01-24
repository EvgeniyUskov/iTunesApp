//
//  DetailsPresenterTests.swift
//  ItunesAppTests
//
//  Created by Evgeniy Uskov on 22.01.2021.
//

import XCTest
@testable import ItunesApp

class DetailsPresenterTests: XCTestCase {
    
    var presenter: DetailsPresenter?
    
    var interactor: DetailsInteractorProtocol?
    var detailsViewController: DetailsViewControllerStub?
    
    var networkManager: NetworkManagerProtocol?
    var storageManager: HistoryStorageProtocol?
    var album: Album?
    
    override func setUpWithError() throws {
        detailsViewController = DetailsViewControllerStub()
        networkManager = NetworkManagerStub()
        storageManager = StorageManagerStub()
        presenter = DetailsPresenter(viewController: detailsViewController!)
        
        guard let presenterLocal = presenter, let networkManager = networkManager else {return}
        interactor = DetailsInteractorStub(presenter: presenterLocal,
                                      networkManager: networkManager)
        
        NetworkManagerStub().fetchAlbums(searchTerm: "Foo", completion: {
            albums in
            self.album = albums?[0]
        })
    }
    
    override func tearDownWithError() throws {
    }

    func testPresentData() throws {
        guard let album = album else {return}
        interactor?.loadDetails(forAlbum: album,
                                completion: {
                                    [weak self] in
                                    XCTAssertEqual(self?.detailsViewController?.viewModel?.tracks?.count, 5, "error in tracks quantity")
                                    XCTAssertEqual(self?.detailsViewController?.viewModel?.tracks?[0].trackName, "FooTrack-0", "error getting TrackName")
                                    XCTAssertEqual(self?.detailsViewController?.viewModel?.tracks?[0].trackNumber, 0, "error getting TrackNumber")
                                    XCTAssertEqual(self?.detailsViewController?.viewModel?.tracks?[0].collectionName, "BarCollection")
        })
    }

}
