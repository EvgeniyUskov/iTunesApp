//
//  SearchControllerBuilder.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 16.01.2021.
//

import UIKit

//MARK: SearchViewControllerBuilder
public class SearchViewControllerBuilder {
    
    public func build() -> SearchViewController {
        let layout = buildLayout()
        
        let viewModel = SearchViewModel(cells: [])
        let searchViewController = SearchViewController(layout: layout, viewModel: viewModel)
        
        let jsonManager = JSONManager()
        let networkManager = URLSessionNetworkManager(jsonManager: jsonManager)
        let storageManager = CoreDataManager()
        
        let presenter = SearchPresenter(viewController: searchViewController)
        let interactor = SearchInteractor(presenter: presenter, networkManager: networkManager, storageManager: storageManager)
        let router = SearchRouter(viewController: searchViewController)
        
        searchViewController.presenter = presenter
        searchViewController.interactor = interactor
        searchViewController.router = router
        
        return searchViewController
    }
    
    private func buildLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 2
        layout.sectionInset.top = 1
        layout.sectionInset.bottom = 1
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth: CGFloat = (screenWidth / 3.0).rounded(.down)
        let itemSize = CGSize(width: itemWidth - 1.0 , height: (itemWidth * 3) / 2)
        layout.itemSize = itemSize
        
        return layout
    }
}
