//
//  ViewController.swift
//  Test
//
//  Created by Arturs Vitins on 05/09/2018.
//  Copyright © 2018 Arturs Vitins. All rights reserved.
//

import UIKit

class FirstVC: UIViewController  {
    
    var allTitles = [String]()
    var allDescriptions = [String]()
    var descriptionToPass = String()
    
    @IBOutlet weak var customTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendData" {
            let destinationVC = segue.destination as! SecondVC
            destinationVC.recDescription = descriptionToPass

        }
    }
    
    @IBAction func getDataBtnAction(_ sender: Any) {
        getAllData()
       
    }
    
}
