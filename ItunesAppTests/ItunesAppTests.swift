//
//  ItunesAppTests.swift
//  ItunesAppTests
//
//  Created by Evgeniy Uskov on 21.01.2021.
//

import XCTest

class ItunesAppTests: XCTestCase {
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }
    
    public func testLoadAlbums() throws {
        let networkManager = NetworkManagerStub()
        networkManager.fetchAlbums(searchTerm: "Test", completion: {
            albums in
            XCTAssertEqual(albums?.count, Optional(5), "error in albums quantity")
            XCTAssertEqual(albums?[0].artistName, "Foo-0", "error getting ArtistName")
            XCTAssertEqual(albums?[0].collectionName, "Bar-0", "error getting collectionName")
            XCTAssertEqual(albums?[0].artistId, 0, "error getting ArtistId")
            XCTAssertEqual(albums?[0].collectionId, 0, "error getting CollectionId")
            
            //            XCTAssertEqual(albums?[0].artistName, "DJ Khaled", "error getting ArtistName")
            //            XCTAssertEqual(albums?[0].collectionName, "All I Do Is Win (feat. T-Pain, Ludacris, Snoop Dogg & Rick Ross) - Single", "error getting CollectionName")
            //            XCTAssertEqual(albums?[0].artistId, "DJ Khaled", "error getting Artist")
            //            XCTAssertEqual(albums?[0].collectionId, "DJ Khaled", "error getting Artist")
        })
        
    }
    
}
