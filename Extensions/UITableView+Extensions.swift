//
//  UITableView+Extensions.swift
//  KoombeaTest
//
//  Created by Fernando Florez on 12/05/23.
//

import UIKit

extension UITableView {
    /// Register cell using only the cell class type
    func registerCell<T>(_ type: T.Type) where T: UITableViewCell {
        let cellName = T.defaultReuseIdentifier
        
        let nibCell = UINib(nibName: cellName, bundle: nil)
        register(nibCell, forCellReuseIdentifier: cellName)
    }
}
