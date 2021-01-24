//
//  DetailsViewController.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 17.01.2021.
//

import UIKit

//MARK: Protocols
public protocol DetailsViewControllerProtocol: AnyObject {
    func displayData(detailsViewModel: DetailsViewModel)
}

//MARK: DetailsViewController
public class DetailsViewController: UITableViewController {
    private var viewModel: DetailsViewModel?
    
    public var router: DetailsRouterProtocol?
    public var interactor: DetailsInteractorProtocol?
    public var presenter: DetailsPresenterProtocol?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
}

// MARK: DetailsViewControllerProtocol Implementation methods
extension DetailsViewController: DetailsViewControllerProtocol {
    public func displayData(detailsViewModel: DetailsViewModel) {
        self.viewModel = detailsViewModel
        DispatchQueue.main.async {
            [weak self] in
            
            self?.tableView.reloadData()
        }
    }
}

//MARK: TableViewDelegate, TableViewDataSource methods
extension DetailsViewController {
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return viewModel?.tracks?.count ?? 0
        } else {
            return 1
        }
    }
    
    public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return Constants.Stuff.tracksHeaderText
        }
        return nil
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Ids.infoCellReuseId, for: indexPath) as? InfoCell {
                guard let viewModel = viewModel else {return UITableViewCell()}
                cell.configure(with: viewModel)
                return cell
            }
            return UITableViewCell()
        }
        
        else if indexPath.section == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Ids.trackCellReuseId, for: indexPath) as? TrackCell {
                guard let track = viewModel?.tracks?[indexPath.row] else { return UITableViewCell()}
                cell.configure(track: track)
                return cell
            }
            return UITableViewCell()
         }
        return UITableViewCell()
    }
    
    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 130
        }
        return 44
    }
}

//MARK: Additional Methods
extension DetailsViewController {
    private func setupTableView() {
        tableView = UITableView(frame: UIScreen.main.bounds, style: .grouped)
        tableView.register(InfoCell.self, forCellReuseIdentifier: Constants.Ids.infoCellReuseId)
        tableView.register(TrackCell.self, forCellReuseIdentifier: Constants.Ids.trackCellReuseId)
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = Constants.Colors.backgroundColor
        tableView.showsVerticalScrollIndicator = false
    }
}
