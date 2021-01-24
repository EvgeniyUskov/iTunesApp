//
//  FeatureList.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 16.01.2021.
//

import Foundation

public class FeatureList {

    public struct FeatureFlag: Codable {
        let musicUrl: String
        let lookupUrl: String
        let itemsLimitCount: String

        private enum CodingKeys: String, CodingKey {
            case musicUrl = "MusicUrl"
            case lookupUrl = "LookupUrl"
            case itemsLimitCount = "LimitItems"
        }
    }

    private static let plistName: String = "FeatureList"
    let featureFlag: FeatureFlag!

    init() {
        do {
            let propertiesDecoder = PropertyListDecoder()
            let data = try? Data(
                contentsOf: Bundle.main.url(forResource: FeatureList.plistName, withExtension: "plist")!)
            featureFlag = try? propertiesDecoder.decode(FeatureFlag.self, from: data!)
        }
    }
}
