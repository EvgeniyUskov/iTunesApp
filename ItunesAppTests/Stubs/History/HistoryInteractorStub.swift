//
//  HistoryInteractorStub.swift
//  ItunesAppTests
//
//  Created by Evgeniy Uskov on 22.01.2021.
//

import Foundation
@testable import ItunesApp

class HistoryInteractorStub {
    var presenter: HistoryPresenterProtocol?
    
    private let storageManager: HistoryStorageProtocol?
    private let transferDataDelegate: TransferDataDelegate?
    
    public init(presenter: HistoryPresenterProtocol,
                storageManager: HistoryStorageProtocol,
                transferDataDelegate: TransferDataDelegate ) {
        self.storageManager = storageManager
        self.presenter = presenter
        self.transferDataDelegate = transferDataDelegate
    }
}

//MARK: HistoryInteractorProtocol Implementation methods
extension HistoryInteractorStub: HistoryInteractorProtocol {
    public func loadHistory() {
        storageManager?.loadHistory(completionHandler: {
            [weak self]
            items in
            DispatchQueue.main.async {
                self?.presenter?.presentData(fromItems: items)
            }
        })
    }
}

//MARK: TransferDataProtocol Implementationmathods
extension HistoryInteractorStub: HistoryTransferDataProtocol {
    public func transferData(searchTerm: String) {
        transferDataDelegate?.transferData(searchTerm: searchTerm)
    }
    
}
