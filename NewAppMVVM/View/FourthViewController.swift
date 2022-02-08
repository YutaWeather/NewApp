//
//  FourthViewController.swift
//  NewAppMVVM
//
//  Created by Yuta Fujii on 2022/02/08.
//

import UIKit

class FourthViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   

    var tableView = UITableView()
    var users = [User]()
    
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
        
        NetworkingService.getData { [weak self] result in
            
            switch result{
            case .success(let users):
                
                self?.users = users
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }

            case .failure(let error):
                print(error)
            }
            
        }
        
        
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
        cell.configure(user: users[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let alertVC = AlertService.showAlert(title: "選択されました", vc: self, user: self.users[indexPath.row])
        self.present(alertVC, animated: true, completion: nil)
       

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

}
