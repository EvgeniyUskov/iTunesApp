//
//  SearchViewControllerBuilderTests.swift
//  ItunesAppTests
//
//  Created by Evgeniy Uskov on 22.01.2021.
//

import XCTest
@testable import ItunesApp

class SearchViewControllerBuilderTests: XCTestCase {
    
    var builder: SearchViewControllerBuilder?
    
    override func setUpWithError() throws {
        builder = SearchViewControllerBuilder()
    }
    
    override func tearDownWithError() throws {
    }
    
    public func testCreateSearchVCEnvironment() throws {
        let vc = builder?.build()
        
        XCTAssertNotNil(vc?.presenter, "No Presenter has been created")
        XCTAssertNotNil(vc?.interactor, "No Interactor has been created")
        XCTAssertNotNil(vc?.router, "No Router has been created")
    }
    
    
}
