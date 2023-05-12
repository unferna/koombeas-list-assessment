//
//  AppUser.swift
//  KoombeaTest
//
//  Created by Fernando Florez on 12/05/23.
//

import Foundation

struct AppUser: Codable {
    var id: Int
    var firstName: String
    var lastName: String
    var username: String
    var email: String
    var gender: String
    var pictureURL: String
    var phone: String
    var birthday: String
    var twitterHandle: String
}
