//
//  NetworkError.swift
//  FirstURLSession
//
//  Created by Christian Quicano on 1/27/22.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case badURL
    case other(Error)
    
    var errorDescription: String? {
        switch self {
        case .badURL:
            return "Bad url"
        case .other(let error):
            return error.localizedDescription
        }
    }
}
