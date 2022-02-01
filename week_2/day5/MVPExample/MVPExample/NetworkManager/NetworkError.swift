//
//  NetworkError.swift
//  MVPExample
//
//  Created by Christian Quicano on 1/31/22.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case badURL
    case other(Error)
    
    var errorDescription: String? {
        switch self {
        case .badURL:
            return "This is a bad URL"
        case .other(let error):
            return error.localizedDescription
        }
    }
    
}
