//
//  ThirdViewController.swift
//  NewAppMVVM
//
//  Created by Yuta Fujii on 2022/02/07.
//

import UIKit
import Combine

class ThirdViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView = UITableView()
//    var observers:[AnyCancellable]? = []
    var observers:[AnyCancellable] = []
    var model = [String]()
    
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
    
    func fetchData(){
        
        APICaller.shared.fetchData().receive(on: DispatchQueue.main).sink(receiveCompletion: { complition in
            
            switch complition{
            case .failure(let error):
                print(error.localizedDescription)
            case .finished:
                print("finished")
            }
            
        }, receiveValue: { [weak self] value in
            
            self?.model = value
            self?.tableView.reloadData()
            
        }).store(in: &observers)
    }
    
    override func viewWillLayoutSubviews() {
        tableView.frame = view.frame
    }
    
    //MARK: UITableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ContentCell.identifier, for: indexPath) as! ContentCell
        cell.configureButtonUI()
        cell.action.sink { text in

            print(text)
            cell.button.setTitle(text, for: .normal)

        }.store(in: &observers)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
