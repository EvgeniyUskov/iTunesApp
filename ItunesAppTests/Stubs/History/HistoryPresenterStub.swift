//
//  HistoryPresenterStub.swift
//  ItunesAppTests
//
//  Created by Evgeniy Uskov on 22.01.2021.
//

import Foundation
@testable import ItunesApp

public class HistoryPresenterStub : HistoryPresenterProtocol {
    var cells: [HistoryCellViewModel]?
    
    public func presentData(fromItems items: [HistoryItem]?) {
        guard let items = items else { return }
        cells = items.map({ genarateCellViewModel(from: $0) })
    }
}

//MARK: Additional methods
extension HistoryPresenterStub {
    private func genarateCellViewModel(from item: HistoryItem) -> HistoryCellViewModel {
        return HistoryCellViewModel(searchText: item.searchText!)
    }
}
