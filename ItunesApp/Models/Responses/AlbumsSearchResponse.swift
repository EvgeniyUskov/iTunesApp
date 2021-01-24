//
//  SearchResponse.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 14.01.2021.
//

import Foundation

//MARK: AlbumSearchResponse
public struct AlbumsSearchResponse: Decodable {
    var resultCount: Int
    var results: [Album]
}

