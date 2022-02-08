//
//  NetworkingService.swift
//  NewAppMVVM
//
//  Created by Yuta Fujii on 2022/02/08.
//

import Foundation

enum NetworkingService{
    
    static func getData(complition:@escaping(Result<[User],Error>)->Void){
        
        let user1 = User(id: 1, name: "あいうえお", email: "*@gmail.com")
        let user2 = User(id: 2, name: "かきくけこ", email: "**@gmail.com")
        let user3 = User(id: 3, name: "さしすせそ", email: "***@gmail.com")

        let users:[User] = [user1,user2,user3]
        complition(.success(users))
    }
    
}
