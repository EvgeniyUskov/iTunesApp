//
//  NetworkManagerStub.swift
//  ItunesAppTests
//
//  Created by Evgeniy Uskov on 21.01.2021.
//

import Foundation
@testable import ItunesApp

public class NetworkManagerStub: NetworkManagerProtocol {
    
    public func fetchAlbums(searchTerm: String, completion: @escaping ([Album]?) -> ()) {
        completion(dummyAlbums)
    }
    
    public func fetchTracks(collectionId: Int, completion: @escaping ([Track]?) -> ()) {
        completion(dummyTracks)
    }
    
    public var dummyAlbums: [Album]? {
        var albums = [Album]()
        for i in 0 ..< 5 {
            albums.append(Album(artistId: i, collectionId: i*4, artistName: "Foo-\(i)", collectionName: "Bar-\(i)", collectionViewUrl: "https://google.com", artworkUrl100: "https://google.com", primaryGenreName: "FooGenre", releaseDate: "2015-01-01T00:00:00.000Z"))
        }
        return albums
    }
    
    public var dummyTracks: [Track] {
        var tracks = [Track]()
        for i in 0 ..< 5 {
            tracks.append(Track(trackName: "FooTrack-\(i)", trackNumber: i, collectionName: "BarCollection", collectionId: 0, artistId: 0))
        }
        
        return tracks
    }
    
}
