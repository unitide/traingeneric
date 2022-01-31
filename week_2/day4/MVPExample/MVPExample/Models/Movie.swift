//
//  Movie.swift
//  MVPExample
//
//  Created by Christian Quicano on 1/31/22.
//

import Foundation

struct Movie: Decodable {
    let originalTitle: String
    let overview: String
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
    }
    
}
