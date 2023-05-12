//
//  ViewController.swift
//  KoombeaTest
//
//  Created by Fernando Florez on 12/05/23.
//

import UIKit

class ViewController: UIViewController {
    private var dataService: UserDataServiceProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataService = UserDataService()
        
        testRequest()
    }

    private func testRequest() {
        dataService?.fetchUsers { users, error in
            users?.forEach { print($0) }
        }
    }
}

