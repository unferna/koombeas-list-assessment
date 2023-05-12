//
//  UserDataService.swift
//  KoombeaTest
//
//  Created by Fernando Florez on 12/05/23.
//

import Foundation

enum UserDataServiceError: Error {
    case urlError
    case requestError(description: String)
    case castingError(description: String)
}

typealias UserCompletionType = ([AppUser]?, UserDataServiceError?) -> Void

protocol UserDataServiceProtocol: AnyObject {
    func fetchUsers(completion: @escaping UserCompletionType)
}

class UserDataService: UserDataServiceProtocol {
    func fetchUsers(completion: @escaping UserCompletionType) {
        let usersAPI = "https://jserver-api.herokuapp.com/users"
        
        guard let url = URL(string: usersAPI) else {
            completion(nil, UserDataServiceError.urlError)
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else {
                completion(nil, UserDataServiceError.requestError(description: error?.localizedDescription ?? ""))
                return
            }
            
            do {
                let users = try JSONDecoder().decode([AppUser].self, from: data)
                completion(users, nil)
                
            } catch let decodeError {
                completion(nil, UserDataServiceError.castingError(description: decodeError.localizedDescription))
            }
        }
        
        task.resume()
    }
}
