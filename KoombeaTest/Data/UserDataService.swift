//
//  UserDataService.swift
//  KoombeaTest
//
//  Created by Fernando Florez on 12/05/23.
//

import Foundation

enum UserDataServiceError: LocalizedError {
    case urlError
    case requestError(description: String)
    case castingError(description: String)
    
    var errorDescription: String? {
        switch self {
        case .urlError:
            return "URL is invalid"
        
        case .requestError(let description):
            return description
        
        case .castingError(let description):
            return description
        }
    }
}

typealias UserCompletionType = ([AppUser]?, UserDataServiceError?) -> Void

protocol UserDataServiceProtocol: AnyObject {
    var baseAPIURL: String { get set }
    func fetchUsers(completion: @escaping UserCompletionType)
}

class UserDataService: UserDataServiceProtocol {
    var baseAPIURL = "https://jserver-api.herokuapp.com"
    
    func fetchUsers(completion: @escaping UserCompletionType) {
        let usersAPI = "\(baseAPIURL)/users"
        
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
