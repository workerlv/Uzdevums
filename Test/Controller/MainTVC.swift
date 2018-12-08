//
//  MainTVC.swift
//  Getting API data
//
//  Created by Arturs Vitins on 08/12/2018.
//  Copyright © 2018 Arturs Vitins. All rights reserved.
//

import UIKit

class MainTVC: UITableViewController {

    var allData = [ReqData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Get Data", style: .plain, target: self, action: #selector(getDataTapped))
    }
    
    @objc func getDataTapped() {
        GetData.getAllData { (data) in
            self.allData = data
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return allData.count }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell()
        cell.textLabel?.numberOfLines = 0
        
        let currData = allData[indexPath.row]
        
        cell.textLabel?.text = currData.title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let descriptionVC = DescriptionVC()
        let currData = allData[indexPath.row]
        descriptionVC.recDescription = currData.description
        navigationController?.pushViewController(descriptionVC, animated: true)
    }
    
}
