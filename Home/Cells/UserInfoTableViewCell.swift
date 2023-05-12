//
//  UserInfoTableViewCell.swift
//  KoombeaTest
//
//  Created by Fernando Florez on 12/05/23.
//

import UIKit
import Kingfisher

class UserInfoTableViewCell: UITableViewCell {
    @IBOutlet private weak var userImage: UIImageView!
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(with user: AppUser) {
        nameLabel.text = user.firstName + " " + user.lastName
        usernameLabel.text = user.username
        emailLabel.text = user.email
        
        guard let imageUrl = URL(string: user.pictureURL) else { return }
        userImage.kf.setImage(with: imageUrl)
    }
}
