//
//  TabBarViewController.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 14.01.2021.
//

import UIKit

//MARK: Protocols
public protocol MainTabBarControllerDelegate: class {
    func switchToSearch(searchTerm: String)
}

//MARK: TabBarViewController
public class TabBarViewController: UITabBarController {
    
    //MARK: View lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchViewController = SearchViewControllerBuilder().build()
        let historyViewController = HistoryViewControllerBuilder().build(mainTabBarDelegate: self, transferDataDelegate: searchViewController)
        
        viewControllers = [
            generateViewController(rootViewController: searchViewController, title: "Search", imageName: "magnifyingglass"),
            generateViewController(rootViewController: historyViewController, title: "Search History", imageName: "music.note.list")
        ]
    }
    
}

//MARK: MainTabBarControllerDelegate methods
extension TabBarViewController: MainTabBarControllerDelegate {
    public func switchToSearch(searchTerm: String) {
        selectedIndex = 0
    }
    
}

//MARK: Additional methods
extension TabBarViewController {
    
    private func generateViewController(rootViewController: UIViewController, title: String, imageName: String) -> UIViewController {
        rootViewController.navigationItem.title = title
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        navigationController.tabBarItem.image = UIImage(systemName: imageName)
        navigationController.tabBarItem.title = title
        UIHelper.setupNavigationControllerUI(for: navigationController)
        let navBarAppearance = UIHelper.setupNavigationBarUI()
        
        navigationController.navigationBar.standardAppearance = navBarAppearance
        navigationController.navigationBar.compactAppearance = navBarAppearance
        navigationController.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        return navigationController
    }
    
    
}
