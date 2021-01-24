//
//  CoreDataManager.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 19.01.2021.
//

import UIKit
import CoreData

//MARK: Protocols
public protocol HistoryStorageProtocol {
    func saveHistory()
    func loadHistory(completionHandler: @escaping (([HistoryItem]) -> ()))
    func addSearchTermToHistory(searchTerm: String)
}

//MARK: CoreDataManager
public class CoreDataManager{
    
    //MARK: Properties
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
}

//MARK: HistoryStorageProtocol Implementation methods
extension CoreDataManager: HistoryStorageProtocol {
   
    public func addSearchTermToHistory(searchTerm: String) {
        DispatchQueue.global(qos: .utility).async {
            [weak self] in
            guard let context = self?.context else {return}
            let historyItem = HistoryItem(context: context)
            historyItem.searchText = searchTerm
            self?.saveHistory()
        }
    }
    
    public func saveHistory() {
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
    }
    
    public func loadHistory(completionHandler: @escaping (([HistoryItem]) -> ())) {
        DispatchQueue.global(qos: .utility).async {
            [weak self] in
            do {
                let historyArray = try self?.context.fetch(HistoryItem.fetchRequest()) as! [HistoryItem]
                completionHandler(historyArray.reversed())
            } catch {
                print("Error fetching data from context \(error)")
            }
        }
    }

}
