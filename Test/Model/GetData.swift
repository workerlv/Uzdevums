//
//  GetData.swift
//  Getting API data
//
//  Created by Arturs Vitins on 08/12/2018.
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

struct GetData {
    
    static func getAllData (returnData: @escaping ([ReqData]) -> Void) {
        
        var allData = [ReqData]()
        
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
                    
                    for info in jsonData.items {
                        
                        guard let title = info.title,
                            let description = info.description
                            else { continue }
                        
                        var reqData = ReqData()
                        reqData.title = title
                        reqData.description = description
                        allData.append(reqData)
                        
                    }
                    
                    returnData(allData)
                    
                } catch {
                    print("catched error")
                }
            }
            
            }.resume()
    }
    
}

struct ReqData {
    var title       = String()
    var description = String()
}
