//
//  DetailsViewControllerStub.swift
//  ItunesAppTests
//
//  Created by Evgeniy Uskov on 22.01.2021.
//

import UIKit
@testable import ItunesApp


public class DetailsViewControllerStub: UIViewController {
    var viewModel: DetailsViewModel?
    
    public var router: DetailsRouterProtocol?
    public var interactor: DetailsInteractorProtocol?
    public var presenter: DetailsPresenterProtocol?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: DetailsViewControllerProtocol Implementation methods
extension DetailsViewControllerStub: DetailsViewControllerProtocol {
    public func displayData(detailsViewModel: DetailsViewModel) {
            self.viewModel = detailsViewModel
    }
}
