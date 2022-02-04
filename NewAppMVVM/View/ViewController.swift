//
//  ViewController.swift
//  NewAppMVVM
//
//  Created by Yuta Fujii on 2022/02/04.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }

    func configure(){
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    override func viewWillLayoutSubviews() {
        tableView.frame = view.frame
    }
    
    //MARK: UITableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        return cell!
    }

}

