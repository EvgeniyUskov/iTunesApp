//
//  UIHelper.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 15.01.2021.
//

import UIKit

public class UIHelper {
    public static func setupTabBarUI() {
        UITabBar.appearance().tintColor = Constants.Colors.textColor
        UITabBar.appearance().barTintColor = Constants.Colors.backgroundColor
    }
    
    public static func setupNavigationBarUI() -> UINavigationBarAppearance {
        
        guard let titleColor = Constants.Colors.textColor else {return UINavigationBarAppearance()}
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = Constants.Colors.backgroundColor
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor]
        navBarAppearance.titleTextAttributes = [.foregroundColor: titleColor]
        return navBarAppearance
    }
    
    public static func setupNavigationControllerUI(for navigationController: UINavigationController) {
        guard let textColor = Constants.Colors.textColor else { return }
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.largeTitleTextAttributes = [.foregroundColor: textColor]
    }
    
    public static func setupSearchBarUI(searchBar: UISearchBar) {
        searchBar.barTintColor = Constants.Colors.backgroundColor
        searchBar.tintColor = Constants.Colors.textColor
        searchBar.textField?.textColor = Constants.Colors.textColor
        searchBar.searchBarStyle = .minimal
    }

}
