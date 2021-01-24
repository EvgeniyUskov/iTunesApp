//
//  TracksSearchResponse.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 20.01.2021.
//

import Foundation

//MARK: TracksSearchResponse
public struct TracksSearchResponse: Decodable {
    var resultCount: Int
    var results: [Track]
}

