//
//  UITableView + Extension.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 22.01.2021.
//

import UIKit

extension UITableView {
    public static func makeTableView() -> UITableView{
        let table = UITableView.init(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .green
        return table
    }
}
