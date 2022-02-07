//
//  FirstViewController.swift
//  NewAppMVVM
//
//  Created by Yuta Fujii on 2022/02/07.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView = UITableView(frame: .zero)
    var users:[User] = []{
        didSet{
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        fetchData()
    }

    func configure(){
        title = "トップ"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ContentCell.self, forCellReuseIdentifier: ContentCell.identifier)
        view.addSubview(tableView)
        
        
    }
    
//    func fetchData(){
//        APIManager.shared.fetchUsers { result in
//            
//            switch result{
//            case .success(let users):
//                DispatchQueue.main.async {
//                    self.users = users
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//            
//        }
//    }
    
    override func viewWillLayoutSubviews() {
        tableView.frame = view.frame
    }
    
    //MARK: UITableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        return newsViewModel.numberOfItemsInSection(section: section)
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ContentCell.identifier, for: indexPath) as! ContentCell
        
//        cell.configure(title: newsViewModel.titleForRowAtIndexxPath(indexPath: indexPath))

        cell.configure(title:  users[indexPath.row].name)
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
