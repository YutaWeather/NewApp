//
//  NewsViewModel.swift
//  NewAppMVVM
//
//  Created by Yuta Fujii on 2022/02/05.
//

import Foundation

final class NewsViewModel {

    var service = Service()
    var articles = [Article]()
    
    func fetchData(completed:@escaping([Article]?,String?) -> Void){
    
        service.fetchNewsArticles { articles, error in
            
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
        print(self.articles[indexPath.row].title!)
        return self.articles[indexPath.row].title!
        
    }
    
    
    
    

}
