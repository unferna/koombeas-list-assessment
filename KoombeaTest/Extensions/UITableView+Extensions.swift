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
    
    /// Dequeue reusable cell using only the cell class type
    func dequeueReusableCell<T>(_ type: T.Type, for indexPath: IndexPath) -> T where T: UITableViewCell {
        let cellName = T.defaultReuseIdentifier
        
        guard let cell = dequeueReusableCell(withIdentifier: cellName, for: indexPath) as? T else {
            fatalError("Couldn't dequeue cell with Identifier: \(cellName).")
        }
        
        return cell
    }
}
