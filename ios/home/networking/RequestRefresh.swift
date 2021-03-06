//
//  RequestRefresh.swift
//  ios
//
//  Created by Matthew on 2/3/20.
//  Copyright © 2020 bahlsenwitz. All rights reserved.
//

import Foundation

class RequestRefresh {
    
    func execute(requestPayload: [String: Any], completion: @escaping (([EntityPlayer]?) -> Void)) {
        
        let url = URL(string: "http://\(ServerAddress().IP):8080/player/refresh")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestPayload, options: .prettyPrinted)
        } catch _ {
            completion(nil)
        }
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            
            guard error == nil else {
                
                completion(nil)
                return
            }
            guard let data = data else {
                
                completion(nil)
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                
                completion(nil)
                return
            }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]] else {
                    
                    completion(nil)
                    return
                }
                
                var leaderboardPage = [EntityPlayer]()
                for index in stride(from: 0, to: json.count, by: 1) {
                    let player: EntityPlayer = ParsePlayer().execute(json: json[index])
                    leaderboardPage.append(player)
                }
                
                completion(leaderboardPage)
                
                
            } catch let error {
                
                completion(nil)
            }
        }).resume()
    }
    
    
    
}
