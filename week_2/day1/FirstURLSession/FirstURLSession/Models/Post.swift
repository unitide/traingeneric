//
//  Post.swift
//  FirstURLSession
//
//  Created by Christian Quicano on 1/27/22.
//

import Foundation


// Array
// Dictionary

struct Post: Decodable {
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
//    init(userId: Int, id: Int, title: String, body: String) {
//        self.userId = userId
//        self.id = id
//        self.title = title
//        self.body = body
//    }
//
//    static func parse(from dictionary: [String: Any]) -> Post {
//        let userId = (dictionary["userId"] as? Int) ?? 0
//        let id = (dictionary["id"] as? Int) ?? 0
//        let title = (dictionary["title"] as? String) ?? ""
//        let body = (dictionary["body"] as? String) ?? ""
//
//        return Post(userId: userId, id: id, title: title, body: body)
//    }
    
}
