//
//  DetailsViewControllerBuiderTests.swift
//  ItunesAppTests
//
//  Created by Evgeniy Uskov on 22.01.2021.
//

import XCTest
@testable import ItunesApp

class DetailsViewControllerBuilderTests: XCTestCase {
    
    var builder: DetailsViewControllerBuilder?
    var album: Album?
        
    override func setUpWithError() throws {
        builder = DetailsViewControllerBuilder()
        NetworkManagerStub().fetchAlbums(searchTerm: "Foo", completion: {
            albums in
            self.album = albums?[0]
        })
    }
    
    override func tearDownWithError() throws {
    }
    
    public func testCreateSearchVCEnvironment() throws {
        guard let album = album else {return}
        builder?.build(withAlbum: album, completion: {
            (vc) in
            XCTAssertNotNil(vc.presenter, "No Presenter has been created")
            XCTAssertNotNil(vc.interactor, "No Interactor has been created")
            XCTAssertNotNil(vc.router, "No Router has been created")
        })
        
        
    }
    
    
}

