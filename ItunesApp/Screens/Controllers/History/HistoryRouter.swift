//
//  HistoryRouter.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 17.01.2021.
//

import Foundation

//MARK: Protocols
public protocol HistoryRouterProtocol {
    func routeToSearch(withText searchTerm: String)
}

//MARK: HistoryRouter
public class HistoryRouter {
    var viewController: HistoryViewControllerProtocol?
    var interactor: HistoryTransferDataProtocol?
    
    //MARK: Init methods
    public init(viewController: HistoryViewControllerProtocol, interactor: HistoryTransferDataProtocol) {
        self.viewController = viewController
        self.interactor = interactor
    }
    
}

extension HistoryRouter: HistoryRouterProtocol {
    public func routeToSearch(withText searchTerm: String) {
        viewController?.mainTabBarDelegate?.switchToSearch(searchTerm: searchTerm)
        interactor?.transferData(searchTerm: searchTerm)
    }
}
