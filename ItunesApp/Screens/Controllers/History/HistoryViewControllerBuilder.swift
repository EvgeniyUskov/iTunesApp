//
//  HistoryViewControllerBuilder.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 17.01.2021.
//

import UIKit

//MARK: HistoryViewControllerBuilder
public class HistoryViewControllerBuilder {
    public func build(mainTabBarDelegate: MainTabBarControllerDelegate, transferDataDelegate: TransferDataDelegate) -> HistoryViewController {
        let historyViewController = HistoryViewController()
        
        let storageManager = CoreDataManager()
        
        let presenter = HistoryPresenter(viewController: historyViewController)
        let interactor = HistoryInteractor(presenter: presenter,
                                           storageManager: storageManager,
                                           transferDataDelegate: transferDataDelegate)
        let router = HistoryRouter(viewController: historyViewController,
                                   interactor: interactor)
        
        historyViewController.presenter = presenter
        historyViewController.interactor = interactor
        historyViewController.router = router
        historyViewController.mainTabBarDelegate = mainTabBarDelegate
        
        return historyViewController
    }
}
