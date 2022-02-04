//
//  Utils.swift
//  RedditChallenge
//
//  Created by Christian Quicano on 2/4/22.
//

import Foundation

class Utils {
    
    func format(date: Date, format: String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
}
