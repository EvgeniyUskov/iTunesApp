//
//  SearchPresenterStub.swift
//  ItunesAppTests
//
//  Created by Evgeniy Uskov on 22.01.2021.
//

import Foundation
@testable import ItunesApp

public class SearchPresenterStub {
    public var albums: [Album]?
}

extension SearchPresenterStub: SearchPresenterProtocol {
    public func presentData(albums: [Album]?) {
        self.albums = albums
    }
}
