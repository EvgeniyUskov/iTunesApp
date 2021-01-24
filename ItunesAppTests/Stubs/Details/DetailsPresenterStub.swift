//
//  DetailsPresenterStub.swift
//  ItunesAppTests
//
//  Created by Evgeniy Uskov on 22.01.2021.
//

import Foundation
@testable import ItunesApp

public class DetailsPresenterStub : DetailsPresenterProtocol {
    var tracks: [Track]?
    
    public func presentDetailsViewModel(fromAlbum album: Album,
                                        tracks: [Track]?,
                                        completion: () -> ()) {
        self.tracks = tracks
        completion()
    }
}

