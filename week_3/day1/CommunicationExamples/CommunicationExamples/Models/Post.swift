//
//  Post.swift
//  CommunicationExamples
//
//  Created by Christian Quicano on 2/2/22.
//

import Foundation

struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
