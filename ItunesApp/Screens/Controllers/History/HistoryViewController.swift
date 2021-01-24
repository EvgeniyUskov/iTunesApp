//
//  HistoryViewController.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 14.01.2021.
//

import UIKit

//MARK: Protocols
public protocol HistoryViewControllerProtocol: AnyObject {
    var mainTabBarDelegate:MainTabBarControllerDelegate? {get}
    func displayData(historyViewModel: HistoryViewModel)
}

//MARK: HistoryViewController
public class HistoryViewController: UITableViewController {
    private var viewModel = HistoryViewModel(cells: [])
    
    public var mainTabBarDelegate: MainTabBarControllerDelegate?
    public var transferDataDelegate: TransferDataDelegate?
    
    var presenter: HistoryPresenterProtocol?
    var interactor: HistoryInteractorProtocol?
    var router: HistoryRouterProtocol?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        interactor?.loadHistory()
    }

    private func setupUI() {
        view.backgroundColor = Constants.Colors.backgroundColor
        tableView.backgroundColor = Constants.Colors.backgroundColor
        tableView.register(HistoryCell.self, forCellReuseIdentifier: Constants.Ids.historyCellReuseId)
//        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
}

//MARK:- TableViewDelegate methods
extension HistoryViewController {
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cells.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Ids.historyCellReuseId, for: indexPath) as! HistoryCell
        let cellViewModel = viewModel.cells[indexPath.row]
        cell.configure(with: cellViewModel)
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToSearch(withText: viewModel.cells[indexPath.row].searchText)
    }
    
    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

//MARK: HistoryViewControllerProtocol Implementation methods
extension HistoryViewController: HistoryViewControllerProtocol {
    public func displayData(historyViewModel: HistoryViewModel) {
        viewModel = historyViewModel
        tableView.reloadData()
    }
}
