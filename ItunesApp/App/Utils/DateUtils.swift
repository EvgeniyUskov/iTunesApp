//
//  DateUtils.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 18.01.2021.
//

import UIKit

extension String {
    func toDateTime () -> Date? {
        if self != "" {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            
            return dateFormatter.date(from: self)
        }
        return nil
    }
}

extension Date {
    func toLiteralString () -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
    
    func toYearString () -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: self)
    }
    
}

