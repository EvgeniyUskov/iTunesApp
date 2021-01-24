//
//  StorageManagerStub.swift
//  ItunesAppTests
//
//  Created by Evgeniy Uskov on 22.01.2021.
//

import Foundation
import CoreData
@testable import ItunesApp

public class StorageManagerStub: HistoryStorageProtocol {
    
    var historyArray = [HistoryItem]()
    
    var testCoreDataStack = TestCoreDataStack()
    
    public func saveHistory() {
        do {
            try testCoreDataStack.mainContext.save()
        } catch {
            print("Error saving context \(error)")
        }
    }
    
    public func loadHistory(completionHandler: @escaping (([HistoryItem]) -> ())) {
        for _ in 0 ... 4 {
            let item = HistoryItem(context: testCoreDataStack.mainContext)
            item.searchText = "Foo"
            historyArray.append(item)
        }
        completionHandler(historyArray)
    }
    
    public func addSearchTermToHistory(searchTerm: String) {
        let item = HistoryItem(context: testCoreDataStack.mainContext)
        item.searchText = searchTerm
        historyArray.append(item)
    }
    
    
}

