//
//  UsersViewModel.swift
//  NewAppMVVM
//
//  Created by Yuta Fujii on 2022/02/07.
//

import Foundation
import Combine
import UIKit

final class UsersViewModel{
    
    private let apiManager:APIManager
    private let endpoint:Endpoint
    var userSubject = PassthroughSubject<[User],Error>()
    
    init(apiManager:APIManager,endpoint:Endpoint){
        self.apiManager = apiManager
        self.endpoint = endpoint
    }
    
    func fetchUser(){
        let url = URL(string: endpoint.urlString)!
        apiManager.fetchUsers(url: url) { (result:Result<[User],Error>) in
                
            switch result{
            case .success(let users):
                self.userSubject.send(users)
            case .failure(let error):
                self.userSubject.send(completion: .failure(error))
                
            }
            
        }
        
    }
    
}
