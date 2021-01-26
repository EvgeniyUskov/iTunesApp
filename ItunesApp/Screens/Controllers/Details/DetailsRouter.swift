//
//  DetailsViewControllerRouter.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 17.01.2021.
//

import Foundation

//MARK: Protocols
public protocol DetailsRouterProtocol: AnyObject {
    
}

//MARK: DetailsRouter
public class DetailsRouter: DetailsRouterProtocol {
    weak var viewController: DetailsViewControllerProtocol?
    
    //MARK: Init methods
    public init(viewController: DetailsViewControllerProtocol?) {
        self.viewController = viewController
    }
}
