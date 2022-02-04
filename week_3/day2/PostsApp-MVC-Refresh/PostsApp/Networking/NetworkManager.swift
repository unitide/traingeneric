//
//  NetworkManager.swift
//  PostsApp
//
//  Created by Christian Quicano on 2/3/22.
//

import Foundation

class NetworkManager {
    
    func fetchData(completion: @escaping ([Post]) -> Void) {
        // 1. https://jsonplaceholder.typicode.com/posts
        
        if let url = URL(string: "https://jsonplaceholder.typicode.com/posts") {
            
            URLSession.shared.dataTask(with: url) { data, urlResponse, error in
                
                if let data = data {
                    
                    do {
                        let result = try JSONDecoder().decode([Post].self, from: data)
                        completion(result)
                    } catch let error {
                        print(error.localizedDescription)
                    }
                    
                    
                }
                
            }
            .resume()
        }
        
        
    }
}
