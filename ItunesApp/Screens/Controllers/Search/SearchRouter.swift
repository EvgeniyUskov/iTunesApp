//
//  SearchRouter.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 16.01.2021.
//
import Foundation
import UIKit

public protocol SearchRouterProtocol {
    func routeToDetails(album: Album)
}

public class SearchRouter {
    public weak var viewController: SearchViewControllerRoutingProtocol?
    
    //MARK: Init methods
    public init(viewController: SearchViewControllerRoutingProtocol) {
        self.viewController = viewController
    }
}

//MARK: SearchRouterProtocol Implemnetation methods
extension SearchRouter: SearchRouterProtocol{
    public func routeToDetails(album: Album) {
        guard let viewController = viewController else { return }
        DetailsViewControllerBuilder().build(withAlbum: album, completion: {
            (detailsViewController) in
            viewController.showDetailViewController(viewController: detailsViewController)
        })
        
    }
}
