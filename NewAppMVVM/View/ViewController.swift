//
//  ViewController.swift
//  NewAppMVVM
//
//  Created by Yuta Fujii on 2022/02/04.
//

import UIKit

class ViewController: UIViewController {

    
    
    private let baseURL = "https://newsapi.org/v2/top-headlines?country=jp&apiKey="
    var setUpUrl = "https://newsapi.org/v2/top-headlines?pageSize=20&country=jp&apiKey="

    override func viewDidLoad() {
        super.viewDidLoad()

        if let APIKEY = KeyManager().getValue(key: "apiKey") as? String {
            
            var url = baseURL + APIKEY
            
        }


    }


}

