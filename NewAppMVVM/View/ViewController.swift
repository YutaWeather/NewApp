//
//  ViewController.swift
//  NewAppMVVM
//
//  Created by Yuta Fujii on 2022/02/04.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView = UITableView()
    var newsViewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    
    }

    func configure(){
        title = "トップ"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ContentCell.self, forCellReuseIdentifier: ContentCell.identifier)
        view.addSubview(tableView)
        
        newsViewModel.fetchData(completed: { articles, error in
            DispatchQueue.main.async {
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
        
        return newsViewModel.numberOfItemsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ContentCell.identifier, for: indexPath) as! ContentCell
        cell.configure(title: newsViewModel.titleForRowAtIndexxPath(indexPath: indexPath))
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

