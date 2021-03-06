//
//  RequestRecent.swift
//  ios
//
//  Created by Matthew on 3/2/20.
//  Copyright © 2020 bahlsenwitz. All rights reserved.
//

import Foundation

class RequestRecent {
    
    func execute(id: String, completion: @escaping ([String: Any]) -> Void) {
        let url = URL(string: "http://\(ServerAddress().IP):8080/game/recent/\(id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            guard error == nil else {
                completion(["fail": "0"])
                return
            }
            guard let data = data else {
                completion(["fail": "1"])
                return
            }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                    completion(["fail": "2"])
                    return
                }
                completion(json)
                
            } catch _ {
               
                completion(["fail": "3"])
            }
        })
        task.resume()
    }
}
