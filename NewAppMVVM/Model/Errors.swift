//
//  Errors.swift
//  NewAppMVVM
//
//  Created by Yuta Fujii on 2022/02/04.
//

import Foundation

enum NetWorkErrors:Error{
    
    case unSatisfied
    
    var title:String{
        switch self{
        case .unSatisfied:return "ネットワーク接続がありません"
        }
    }
    
}

enum FetchErrors:Error{
    
    case noResult
    case someError
    case emptyError
    
    var title:String{
        
        switch self{
        case .noResult:return "結果がありませんでした。"
        case .someError:return "予期せぬエラーが発生しました。"
        case .emptyError:return "何も入力されていません。"
            
        }
    }
    
}

