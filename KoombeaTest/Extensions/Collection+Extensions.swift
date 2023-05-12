//
//  Collection+Extensions.swift
//  KoombeaTest
//
//  Created by Fernando Florez on 12/05/23.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
    
    var isNotEmpty: Bool {
        !self.isEmpty
    }
}
