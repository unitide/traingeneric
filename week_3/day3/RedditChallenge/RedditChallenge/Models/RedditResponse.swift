//
//  RedditResponse.swift
//  RedditChallenge
//
//  Created by Christian Quicano on 2/4/22.
//

import Foundation

struct RedditResponse: Codable {
    let kind: String
    let data: RedditData
}

struct RedditData: Codable {
    let after : String
    let children: [Child]
}

struct Child: Codable {
    let kind: String
    let data: Story
}

struct Story: Codable {
    
    let title: String
    let thumbnail: String
    let thumbnailHeight: Int?
    let score: Int
    let numComments: Int
    
    enum CodingKeys: String, CodingKey {
        case title, thumbnail, score
        case thumbnailHeight = "thumbnail_height"
        case numComments = "num_comments"
    }
    
}
