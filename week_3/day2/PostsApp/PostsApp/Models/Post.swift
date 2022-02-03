//
//  Post.swift
//  PostsApp
//
//  Created by Christian Quicano on 2/3/22.
//

import Foundation

struct Post: Codable {
    
    let userId: String
    let id: Int
    let title: String
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case userId
        case id
        case title
        case overview = "body"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        overview = try container.decode(String.self, forKey: .overview)

        if let temp = try? container.decode(Int.self, forKey: .userId) {
            userId = "00\(temp)"
        } else {
            userId = ""
        }

    }
    
}
