//
//  NetwrokManager.swift
//  FirstURLSession
//
//  Created by Christian Quicano on 1/26/22.
//

import Foundation

//enum URLStatus: Int {
//    case unauthorized
//}

class NetworkManager {
    
    func getStories(from url: String, completion: @escaping (Result<RedditResponse, NetworkError>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.other(error)))
                return
            }
            
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(RedditResponse.self, from: data)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(.other(error)))
                }
            }
        }
        .resume()
    }
    
    func getPosts(from url: String, completion: @escaping (Result<[Post], NetworkError>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.badURL))
            return
        }
        
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            
//            if let response = response as? HTTPURLResponse {
//                if let statusCase = URLStatus(rawValue: response.statusCode) {
//                    if statusCase == .unauthorized {
//                        if let data = data {
//
//                        }
//                    }
//                }
//            }
            
            if let data = data {
                do {
                    
                    
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    completion(.success(posts))
                    
                    
                    // old parsing json in our model
                    // convert this data into a Dictionary
//                    if let response = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
//                        var posts = [Post]()
//                        for item in response {
//                            let post = Post.parse(from: item)
//                            posts.append(post)
//                        }
//                        completion(.success(posts))
//                    }
                    
                    
                    
                    
                    
                } catch let error {
                    completion(.failure(.other(error)))
                }
                return
            }
            
            if let error = error {
                completion(Result.failure(NetworkError.other(error)))
            }
            
        }
        .resume()
        
    }
    
}

