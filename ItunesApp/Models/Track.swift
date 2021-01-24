//
//  File.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 20.01.2021.
//

import Foundation

//MARK: Track
public struct Track: Decodable {
    
    //MARK: Properties
    public var trackName: String?
    public var trackNumber: Int?
    public var collectionName: String?
    public var collectionId: Int?
    public var artistId: Int?
}
