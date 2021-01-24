//
//  DetailsModels.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 17.01.2021.
//

import Foundation

public struct DetailsViewModel {
    public var album: Album
    public let iconUrlString: String?
    public let previewUrl: String?
    
    public var artistName: String?
    public var collectionName: String?
    
    public var releaseDate: String?
    public var primaryGenreName: String?
    
    public var tracks: [Track]?
}
