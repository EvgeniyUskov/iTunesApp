//
//  SearchModels.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 16.01.2021.
//
import UIKit

public struct SearchViewModel {
    public let cells: [CellViewModel]
}

public struct CellViewModel {
    public var album: Album
    
    public let iconUrlString: String?
    public let previewUrl: String?
    
    public var artistName: String?
    public var collectionName: String?
    
    public var releaseDate: String?
    public var primaryGenreName: String?
    
    public var tracks: [Track]?
}
