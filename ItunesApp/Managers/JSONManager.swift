//
//  JSONManager.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 15.01.2021.
//

import Foundation

//MARK: Protocols
public protocol JSONManagerProtocol {
    func parseAlbums(from data: Data) -> AlbumsSearchResponse?
    func parseTracks(from data: Data) -> TracksSearchResponse?
}

//MARK: JSONManager
public class JSONManager {
    
}

//MARK: JSONManagerProtocol Implementation methods
extension JSONManager: JSONManagerProtocol{
    
    public func parseAlbums(from data: Data) -> AlbumsSearchResponse? {
        do {
            let albumsSearchResponse = try JSONDecoder().decode(AlbumsSearchResponse.self, from: data)
            return albumsSearchResponse
        } catch {
            print("error getting albums:", error)
            return nil
        }
    }
    
    public func parseTracks(from data: Data) -> TracksSearchResponse? {
        do {
            let tracksSearchResponse = try JSONDecoder().decode(TracksSearchResponse.self, from: data)
            return tracksSearchResponse
        } catch {
            print("error getting albums:", error)
            return nil
        }
    }

}
