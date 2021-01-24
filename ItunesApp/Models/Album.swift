//
//  Album.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 17.01.2021.
//

import Foundation

//MARK: ALbum
public struct Album: Decodable {
    
    //MARK: Properties
    public var artistId: Int?
    public var collectionId: Int?

    public var artistName: String?
    public var collectionName: String?

    public var collectionViewUrl: String?
    public var artworkUrl100: String?
    public var primaryGenreName: String?
    public var releaseDate: String?
}

extension Album: Comparable {
    public static func >= (lhs: Album, rhs: Album) -> Bool {
        guard let lhsName = lhs.collectionName, let rhsName = rhs.collectionName else { return false }
        return lhsName >= rhsName
    }
    public static func <= (lhs: Album, rhs: Album) -> Bool {
        guard let lhsName = lhs.collectionName, let rhsName = rhs.collectionName else { return false }
        return lhsName <= rhsName
    }
    public static func > (lhs: Album, rhs: Album) -> Bool {
        guard let lhsName = lhs.collectionName, let rhsName = rhs.collectionName else { return false }
        return lhsName > rhsName
    }
    public static func < (lhs: Album, rhs: Album) -> Bool {
        guard let lhsName = lhs.collectionName, let rhsName = rhs.collectionName else { return false }
        return lhsName < rhsName
    }
}

