//
//  HistoryViewControllerBuilderTests.swift
//  ItunesAppTests
//
//  Created by Evgeniy Uskov on 22.01.2021.
//

import Foundation

import XCTest
@testable import ItunesApp

class HistoryViewControllerBuilderTests: XCTestCase {
    var builder: HistoryViewControllerBuilder?
    let delegate = SearchViewControllerBuilder().build()
    let tabBarDelegate = TabBarViewController()
    override func setUpWithError() throws {
        builder = HistoryViewControllerBuilder()
    }
    
    override func tearDownWithError() throws {
    }
    
    public func testCreateHistoryVCEnvironment() throws {
        let vc = builder?.build(mainTabBarDelegate: tabBarDelegate, transferDataDelegate: delegate)
        
        XCTAssertNotNil(vc?.presenter, "No Presenter has been created")
        XCTAssertNotNil(vc?.interactor, "No Interactor has been created")
        XCTAssertNotNil(vc?.router, "No Router has been created")
    }
   
}

