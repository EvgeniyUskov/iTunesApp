//
//  SearchViewControllerStub.swift
//  ItunesAppTests
//
//  Created by Evgeniy Uskov on 22.01.2021.
//


import UIKit
@testable import ItunesApp

//MARK: SearchViewControllerStub
public class SearchViewControllerStub: UICollectionViewController {
    
    //MARK: Properties
    var viewModel = SearchViewModel(cells: [])
    
    public var router: SearchRouterProtocol?
    public var interactor: SearchInteractorProtocol?
    public var presenter: SearchPresenterProtocol?
    
    //MARK: Init methods
    public init(layout: UICollectionViewLayout, viewModel: SearchViewModel) {
        super.init(collectionViewLayout: layout)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: UISearchBarDelegate implementation methods
extension SearchViewControllerStub: UISearchBarDelegate {
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchTerm: String) {
        self.interactor?.loadAlbums(searchTerm: searchTerm)
        self.interactor?.addSearchTermToHistory(searchTerm: searchTerm)
    }
}

//MARK: SearchViewControllerProtocol implementation protocols
extension SearchViewControllerStub: SearchViewControllerProtocol {
    public func displayData(searchViewModel: SearchViewModel) {
        self.viewModel = searchViewModel
    }
}

//MARK: TransferDataDelegate implementation protocols
extension SearchViewControllerStub: TransferDataDelegate {
    public func transferData(searchTerm: String) {
    }
}

//MARK: SearchViewControllerRoutingProtocol implementation protocols
extension SearchViewControllerStub: SearchViewControllerRoutingProtocol {
    public func showDetailViewController(viewController: UIViewController) {
    }
    
}

//MARK: Additional methods
extension SearchViewController {
    
    private func setupUI() {
        setupSearchBar()
        setupCollectionView()
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = Constants.Stuff.searchPlaceholderText
        UIHelper.setupSearchBarUI(searchBar: searchController.searchBar)
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = Constants.Colors.backgroundColor
        let nib = UINib(nibName: Constants.NibNames.albumCellNibName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: Constants.Ids.albumCellReuseId)
        collectionView.register(ItemsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.Ids.collectionHeaderId)
    }
    
    private func scrollToTheTop() {
        let firstIndexPath = IndexPath(item: 0, section: 0)
        self.collectionView.scrollToItem(at: firstIndexPath, at: .top , animated: true)
    }
    
}

