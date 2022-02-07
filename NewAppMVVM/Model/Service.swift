//
//  Service.swift
//  NewAppMVVM
//
//  Created by Yuta Fujii on 2022/02/04.
//

import Foundation

class Service{
    
    private let baseURL = "https://newsapi.org/v2/top-headlines?country=jp&apiKey="
    var setUpUrl = "https://newsapi.org/v2/top-headlines?pageSize=20&country=jp&apiKey="
    var newsModel:NewsModel?
    
    static let shareInstance = Service()
    
    func fetchNewsArticles(completed:@escaping([Article]?,String?) -> Void){
        
        if let APIKEY = KeyManager().getValue(key: "apiKey") as? String {
            
            let newsURLWithApiKey = baseURL + APIKEY

            guard let url = URL(string: newsURLWithApiKey) else { return }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                if error != nil{
                    print(FetchErrors.someError.title)
                    completed(nil, FetchErrors.someError.title)
                    return
                }
                
                guard response != nil else {
                    print(FetchErrors.noResult.title)
                    completed(nil, FetchErrors.noResult.title)
                    return
                }
                
                guard data != nil else {
                    print(FetchErrors.noResult.title)
                    completed(nil, FetchErrors.noResult.title)
                    return
                }
                
                do{

                    self.newsModel = try JSONDecoder().decode(NewsModel.self, from: data!)
                    completed(self.newsModel?.articles, nil)
                    
                }catch{
                    
                }
                
            }.resume()
            
        }
        
    }
    
}
