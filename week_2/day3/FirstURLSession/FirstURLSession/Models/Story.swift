//
//  Story.swift
//  FirstURLSession
//
//  Created by Christian Quicano on 1/27/22.
//

import Foundation

typealias Story = RedditResponse.DataRedditResponse.Child.Story

struct RedditResponse: Codable {
    let data: DataRedditResponse
    struct DataRedditResponse: Codable {
        let children: [Child]
        struct Child: Codable {
            let data: Story
            struct Story: Codable {
                let title: String
                let fullname: String // camelCase
                
                enum CodingKeys: String, CodingKey {
                    case title = "title"
                    case fullname = "author_fullname"
                }
                
            }
        }
    }
}
