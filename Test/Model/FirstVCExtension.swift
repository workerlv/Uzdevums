//
//  FirstVCExtension.swift
//  Test
//
//  Created by Arturs Vitins on 06/09/2018.
//  Copyright © 2018 Arturs Vitins. All rights reserved.
//

import UIKit

struct JsonDataStruct: Decodable {
    let items: [ItemDataStruct]
    
}

struct ItemDataStruct: Decodable {
    let title: String?
    let description: String?
    
}


extension FirstVC: UITableViewDelegate, UITableViewDataSource {
    
    func getAllData () {
        
        let urlLink = "http://api.rss2json.com/v1/api.json?rss_url=https://mars.nasa.gov/rss/blogs.cfm"
        
        guard let url = URL(string: urlLink) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let recData = data else { return }
            
            DispatchQueue.main.async {
                
                do {
                    
                    let jsonData = try JSONDecoder().decode(JsonDataStruct.self, from: recData)
                    
                    self.allTitles.removeAll()
                    self.allDescriptions.removeAll()
                    
                    for info in jsonData.items {
                        
                        if info.title != nil && info.description != nil {
                            self.allTitles.append(info.title!)
                            self.allDescriptions.append(info.description!)
                            
                        }
                    }
                    
                    
                    self.customTableView.reloadData()
                    
                } catch {
                    
                    print("catched error")
                    
                }
            }
            
            }.resume()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTitles.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = allTitles[indexPath.row]
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        descriptionToPass = allDescriptions[indexPath.row]
        
        self.performSegue(withIdentifier: "sendData", sender: nil)
    }
    
}
