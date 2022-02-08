//
//  FourthViewController.swift
//  NewAppMVVM
//
//  Created by Yuta Fujii on 2022/02/08.
//

import UIKit
import Combine

class FourthViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   

    var tableView = UITableView()
    var users = [User]()
    
    var getUserDataToken:AnyCancellable?
    
    var tokens = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        getData()
    }
    
    func configure(){
        title = "トップ"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ContentCell.self, forCellReuseIdentifier: ContentCell.identifier)
        view.addSubview(tableView)
        
    }
    
  
    func getData(){
  
        
        getUserDataToken = NetworkingService.getData().sink { complition in
            
            switch complition{
            case .finished:
                print("publisher stopped observed")
            
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        } receiveValue: { [weak self] users in
            self?.users = users
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }

        
        
//        NetworkingService.getData { [weak self] result in
//
//            switch result{
//            case .success(let users):
//
//                self?.users = users
//                DispatchQueue.main.async {
//                    self?.tableView.reloadData()
//                }
//
//            case .failure(let error):
//                print(error)
//            }
//
//        }
        
        
    }
    
    override func viewWillLayoutSubviews() {
        tableView.frame = view.frame
    }
    
    //MARK: UITableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ContentCell.identifier, for: indexPath) as! ContentCell
//        cell.delegate = self
            cell.actionPublisher.sink { action in
            
            switch action{
            case .showAlert(let user):
                self.present(AlertService.showAlert(title: user.name, vc: self, user: user), animated: true, completion:nil)
                
            case .otherShowAlert(let user):
                self.present(AlertService.showAlert(title: user.email, vc: self, user: user), animated: true, completion:nil)
            }
            
            }.store(in: &tokens)
        
        cell.configure(user: users[indexPath.row])
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

}
