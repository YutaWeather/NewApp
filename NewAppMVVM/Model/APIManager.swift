//
//  APIManager.swift
//  NewAppMVVM
//
//  Created by Yuta Fujii on 2022/02/07.
//

import Foundation

enum Endpoint {
    case userFetch
//    case LastMessage
//    case Messages

    var urlString:String{
        switch self {
        case .userFetch:
            return "https://jsonplaceholder.typicode.com/users"

//        case .LastMessage:
//            return manager.GET("/api/last-message.json", parameters: parameters, success: success, failure: failure)
//        case .Messages:
//            return manager.GET("/api/messages.json", parameters: parameters, success: success, failure: failure)
        }
    }
    
}

class APIManager{
    
    //TはDynamic(動的)
    func fetchUsers<T:Decodable>(url:URL,complition:@escaping(Result<[T],Error>)->Void){
        
        URLSession.shared.dataTaskPublisher(for: url).map{ $0.data }.decode(type: [T].self, decoder: JSONDecoder()).sink { resultComplition in
            
            switch resultComplition{
            case .failure(let error):
                
                complition(.failure(error))
                    
            case .finished:
                break
            }
            
        } receiveValue: { resultArray in
            
            complition(.success(resultArray))
            
        }

        
        
    }
    
//    //コメント受信
//    func fetchComments<T:Decodable>(complition:@escaping(Result<[T],Error>)->Void){
//
//    }
//
//    //投稿受信
//    func fetchPosts<T:Decodable>(complition:@escaping(Result<[T],Error>)->Void){
//
//    }
//
}

//class APIManager{
//
//    static let shared = APIManager()
//
//    func fetchUsers(complition:@escaping(Result<[User],Error>)->Void){
//
//        let urlString = "https://jsonplaceholder.typicode.com/users"
//
//        let url = URL(string: urlString)!
//        URLSession.shared.dataTask(with: url) { data, request,error in
//
//            if let error = error {
//                complition(.failure(error))
//                return
//            }
//
////            if let request = request {
////                complition(.failure(error as! Error))
////                return
////            }
//
//            do{
//                let users = try JSONDecoder().decode([User].self, from: data!)
//                complition(.success(users))
//
//            }catch{
//                complition(.failure(error))
//
//            }
//
//        }.resume()
//
//    }
//
//}
