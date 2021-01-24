//
//  SearchViewController.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 14.01.2021.
//

import UIKit

//MARK: Protocols
public protocol SearchViewControllerProtocol: AnyObject {
    func displayData(searchViewModel: SearchViewModel)
}

public protocol SearchViewControllerRoutingProtocol: AnyObject {
    func showDetailViewController(viewController: UIViewController)
}

public protocol TransferDataDelegate {
    func transferData(searchTerm: String)
}

//MARK: SearchViewController
public class SearchViewController: UICollectionViewController {
    
    //MARK: Properties
    let searchController = UISearchController(searchResultsController: nil)

    private var timer : Timer?
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
        setupUI()
    }
}

//MARK: UICollectionViewDelegate, UICollectionViewDataSource Implementation methods
extension SearchViewController {
    public override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cells.count
    }
    
    public override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Ids.albumCellReuseId, for: indexPath) as! AlbumCell
        let itemViewModel = viewModel.cells[indexPath.row]
        cell.configure(with: itemViewModel)
        return cell
    }
    
    public override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var supplementaryView = UICollectionReusableView()
        if kind == UICollectionView.elementKindSectionHeader {
            supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constants.Ids.collectionHeaderId, for: indexPath)
        }
        return supplementaryView
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 20)
    }
    
    public override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        router?.routeToDetails(album: viewModel.cells[indexPath.row].album)
    }
}

//MARK: UISearchBarDelegate implementation methods
extension SearchViewController: UISearchBarDelegate {
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchTerm: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.interactor?.loadAlbums(searchTerm: searchTerm)
            self.interactor?.addSearchTermToHistory(searchTerm: searchTerm)
        })
    }
}

//MARK: UICollectionViewDelegateFlowLayout implementation methods
extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dimension = (collectionView.bounds.width - 10 - 10) / 3
        return CGSize(width: dimension , height: dimension)
    }

}

//MARK: SearchViewControllerProtocol implementation protocols
extension SearchViewController: SearchViewControllerProtocol {
    public func displayData(searchViewModel: SearchViewModel) {
        DispatchQueue.main.async {
            [weak self] in
            self?.viewModel = searchViewModel
            self?.collectionView.reloadData()
            if self?.viewModel.cells.count != 0 {
                self?.scrollToTheTop()
            }
        }
    }
}

//MARK: TransferDataDelegate implementation protocols
extension SearchViewController: TransferDataDelegate {
    public func transferData(searchTerm: String) {
        searchController.searchBar.text = searchTerm
        self.searchBar(searchController.searchBar, textDidChange: searchTerm)
        collectionView.reloadData()
    }
}

//MARK: SearchViewControllerRoutingProtocol implementation protocols
extension SearchViewController: SearchViewControllerRoutingProtocol {
    public func showDetailViewController(viewController: UIViewController) {
        DispatchQueue.main.async{
            [weak self] in
            self?.showDetailViewController(viewController, sender: self)
        }
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
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: Constants.Ids.albumCellReuseId)
        collectionView.register(ItemsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.Ids.collectionHeaderId)
    }

    private func scrollToTheTop() {
        let firstIndexPath = IndexPath(item: 0, section: 0)
        self.collectionView.scrollToItem(at: firstIndexPath, at: .top , animated: true)
    }
    
}

