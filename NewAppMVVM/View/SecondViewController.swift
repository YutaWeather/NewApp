//
//  SecondViewController.swift
//  NewAppMVVM
//
//  Created by Yuta Fujii on 2022/02/07.
//

import UIKit
import Combine

class SecondViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView = UITableView()
    var userViewModel:UsersViewModel?
    private var apiManager = APIManager()
    var users = [User]()
    private var subscriber:AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        setUpViewModel()
        observerViewModel()

    }

    func configure(){
        title = "トップ"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ContentCell.self, forCellReuseIdentifier: ContentCell.identifier)
        view.addSubview(tableView)
    }
        
    private func setUpViewModel(){
        
        userViewModel = UsersViewModel(apiManager: apiManager,
                                       endpoint: .userFetch)
        
    }
    
    
    private func fetchUsers(){
        
        userViewModel?.fetchUser()
        
    }
    
    private func observerViewModel(){
       subscriber = userViewModel?.userSubject.sink(receiveCompletion: { (resultCompletion) in
            
            switch resultCompletion{
            case .failure(let error):
                print(error.localizedDescription)
            case .finished:
                break
            }
            
        }, receiveValue: { users in
            DispatchQueue.main.async {
                
                self.users = users
                self.tableView.reloadData()
            }

        })
    }
    
    
    override func viewWillLayoutSubviews() {
        tableView.frame = view.frame
    }
    
    //MARK: UITableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ContentCell.identifier, for: indexPath) as! ContentCell
        cell.configure(title:  users[indexPath.row].name)
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
