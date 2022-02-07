//
//  NewsViewModel.swift
//  NewAppMVVM
//
//  Created by Yuta Fujii on 2022/02/05.
//

import Foundation

final class NewsViewModel {

    //M → View(Controller)
    //Model内のメソッドを呼ぶ ,ViewControllerへ呼んでもらう用のメソッドを作成
    
    //View(Controller) → M
    // →次これ
    
    var articles = [Article]()
    
    func fetchData(completed:@escaping([Article]?,String?) -> Void){
    
        Service.shareInstance.fetchNewsArticles { articles, error in
            
            if error != nil{
                completed(nil, FetchErrors.someError.title)
                return
            }
            self.articles = articles!
            completed(self.articles, nil)
        }
        
    }

    func numberOfItemsInSection(section:Int) -> Int{
        return self.articles.count
    }
    
    func titleForRowAtIndexxPath(indexPath:IndexPath) -> String{
        return self.articles[indexPath.row].title!
    }

}
