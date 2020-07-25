//
//  ViewController.swift
//  ShimmerTableView
//
//  Created by Maksim on 25/07/2020.
//  Copyright © 2020 Maksim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var tableView: UITableView!
    fileprivate let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 1, alpha: 1)
        
        configureTableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    private func configureTableView() {
        tableView = UITableView()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
}

