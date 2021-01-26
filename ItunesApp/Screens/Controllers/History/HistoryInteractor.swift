//
//  HistoryInteractor.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 17.01.2021.
//

import Foundation

//Protocols
public protocol HistoryInteractorProtocol: AnyObject {
    func loadHistory()
}

public protocol HistoryTransferDataProtocol: AnyObject {
    func transferData(searchTerm: String)
}

//MARK: HistoryInteractor
public class HistoryInteractor {
    weak var presenter: HistoryPresenterProtocol?
    
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
extension HistoryInteractor: HistoryInteractorProtocol {
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
extension HistoryInteractor: HistoryTransferDataProtocol {
    public func transferData(searchTerm: String) {
        transferDataDelegate?.transferData(searchTerm: searchTerm)
    }
    
}
