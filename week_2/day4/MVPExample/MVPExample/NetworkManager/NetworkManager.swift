//
//  NetworkManager.swift
//  MVPExample
//
//  Created by Christian Quicano on 1/31/22.
//

import Foundation

class NetworkManager {
    
    func getMovies(from url: String, completion: @escaping (Result<MovieResponse, NetworkError>) -> Void ) {
        
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
                    let response = try JSONDecoder().decode(MovieResponse.self, from: data)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(.other(error)))
                }
            }
        }
        .resume()
    }
    
}
