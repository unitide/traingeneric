//
//  NetworkManager.swift
//  RedditChallenge
//
//  Created by Christian Quicano on 2/4/22.
//

import Foundation

class NetworkManager {
    
    func getModel<Model: Codable>(_ type: Model.Type, from url: String, completion: @escaping (Result<Model, NetworkError>) -> ()) {
        
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
                    let response = try JSONDecoder().decode(type, from: data)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(.other(error)))
                }
            }
        }
        .resume()
        
    }
    
    func getStories(from url: String, completion: @escaping (Result<RedditResponse, NetworkError>) -> Void ) {
        
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
                //decode
                do {
                    let response = try JSONDecoder().decode(RedditResponse.self, from: data)
                    completion(.success(response))
//                    let stories = response.data.children.map { $0.data }
//                    completion(.success(stories))
                } catch let error {
                    completion(.failure(.other(error)))
                }
            }
        }
        .resume()
    }
    
    func getImageData(from url: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data)
        }
        .resume()
    }
}
