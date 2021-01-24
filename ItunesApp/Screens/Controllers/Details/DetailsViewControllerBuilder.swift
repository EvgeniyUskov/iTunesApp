//
//  DetailsViewControllerBuilder.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 17.01.2021.
//

import Foundation

//MARK: DetailsViewControllerBuilder
public class DetailsViewControllerBuilder {
    public func build(withAlbum album: Album, completion: @escaping (DetailsViewController) -> ()) {
        let detailsViewController = DetailsViewController()
        
        let jsonManager = JSONManager()
        let networkManager = URLSessionNetworkManager(jsonManager: jsonManager)
        
        let presenter = DetailsPresenter(viewController: detailsViewController)
        let interactor = DetailsInteractor(presenter: presenter, networkManager: networkManager)
        let router = DetailsRouter(viewController: detailsViewController)
        
        detailsViewController.presenter = presenter
        detailsViewController.interactor = interactor
        detailsViewController.router = router

        interactor.loadDetails(forAlbum: album, completion: {
            completion(detailsViewController)
        })
    }
    
}
