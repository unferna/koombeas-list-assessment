//
//  ViewController.swift
//  KoombeaTest
//
//  Created by Fernando Florez on 12/05/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var usersTableView: UITableView!
    
    private var dataService: UserDataServiceProtocol?
    private var users: [AppUser] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataService = UserDataService()
        commonInit()
        loadUsers()
    }
    
    private func commonInit() {
        configTable()
    }
    
    private func configTable() {
        usersTableView.registerCell(UserInfoTableViewCell.self)
        usersTableView.dataSource = self
    }

    private func loadUsers() {
        dataService?.fetchUsers { [weak self] users, error in
            guard let self = self else { return }
            self.users = users ?? []
            
            DispatchQueue.main.async {
                self.usersTableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(UserInfoTableViewCell.self, for: indexPath)
        cell.configureCell(with: user)
        return cell
    }
    
}
