//
//  APICaller.swift
//  NewAppMVVM
//
//  Created by Yuta Fujii on 2022/02/07.
//

import Foundation
import Combine

class APICaller{
    
    static let shared = APICaller()
    
    func fetchData()->Future<[String],Error>{
            
        return Future{ promise in
            promise(.success(["あ","い","う","え","お"]))
        }
        
    }
    
}
