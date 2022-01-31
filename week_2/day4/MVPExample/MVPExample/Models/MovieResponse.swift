//
//  MovieResponse.swift
//  MVPExample
//
//  Created by Christian Quicano on 1/31/22.
//

import Foundation

struct MovieResponse: Decodable {
    let results: [Movie]
}
