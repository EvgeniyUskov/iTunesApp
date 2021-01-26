//
//  HistoryPresenter.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 17.01.2021.
//

import Foundation

//MARK: Protocols
public protocol HistoryPresenterProtocol: AnyObject {
    func presentData(fromItems items: [HistoryItem]?)
}

//MARK: HistoryPresenter
public class HistoryPresenter {
    weak var viewController: HistoryViewControllerProtocol?
    
    public init(viewController: HistoryViewControllerProtocol) {
        self.viewController = viewController
    }
    
}

//MARK: HistoryPresenterProtocol Implementation
extension HistoryPresenter: HistoryPresenterProtocol {
    public func presentData(fromItems items: [HistoryItem]?) {
        guard let items = items else { return }
        let cells = items.map({ genarateCellViewModel(from: $0) })
        let historyViewModel = HistoryViewModel(cells: cells)
        viewController?.displayData(historyViewModel: historyViewModel)
        
    }

}

//MARK: Additional methods
extension HistoryPresenter {
    private func genarateCellViewModel(from item: HistoryItem) -> HistoryCellViewModel {
        return HistoryCellViewModel(searchText: item.searchText!)
    }

}
