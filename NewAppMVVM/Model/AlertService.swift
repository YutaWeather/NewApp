//
//  AlertService.swift
//  NewAppMVVM
//
//  Created by Yuta Fujii on 2022/02/08.
//

import Foundation
import UIKit

enum AlertService{
    
    static func showAlert(title:String,vc:UIViewController,user:User) -> UIAlertController{
            
        let alert = UIAlertController(title: title, message: user.name, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        return alert
        
    }
    
}
