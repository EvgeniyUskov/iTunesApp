//
//  HistoryViewControllerStub.swift
//  ItunesAppTests
//
//  Created by Evgeniy Uskov on 22.01.2021.
//

import UIKit
@testable import ItunesApp


public class HistoryViewControllerStub: UIViewController {
    var viewModel: HistoryViewModel?
    
    public var router: HistoryRouterProtocol?
    public var interactor: HistoryInteractorProtocol?
    public var presenter: HistoryPresenterProtocol?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
//
//// MARK: HistoryViewControllerProtocol Implementation methods
//extension HistoryViewControllerStub: HistoryViewControllerProtocol {
//    public var mainTabBarDelegate: MainTabBarControllerDelegate? {
////        return self
//    }
//    
//    public func displayData(historyViewModel: HistoryViewModel) {
//            self.viewModel = historyViewModel
//    }
//}
