//
//  HistoryModels.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 19.01.2021.
//

import Foundation

public struct HistoryViewModel {
    public let cells: [HistoryCellViewModel]
}

public struct HistoryCellViewModel {
    public var searchText: String
}
