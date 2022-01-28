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
    
}
