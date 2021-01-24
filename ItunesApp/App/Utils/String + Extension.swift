//
//  URL + Extension.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 14.01.2021.
//

import Foundation

extension String {
    func urlifySpaces() -> String {
        if let regex = try? NSRegularExpression(pattern: "\\s", options: .caseInsensitive) {
            let modifiedString = regex.stringByReplacingMatches(in: self, options: [], range: NSRange(location: 0, length:  self.count), withTemplate: "+")
            return modifiedString
        }
        return self
    }

}
