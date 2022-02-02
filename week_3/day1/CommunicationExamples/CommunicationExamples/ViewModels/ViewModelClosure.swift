//
//  ViewModelClosure.swift
//  CommunicationExamples
//
//  Created by Christian Quicano on 2/2/22.
//

import Foundation

class ViewModelClosure {
    
    private let networkManager = NetworkManagerClosure()
    private var posts = [Post]()
    
    var displayPosts: (([Post]) -> Void)?
    
    func getPost() {
        networkManager.getModel([Post].self, from: NetworkURLs.postsURL) { [weak self] result in
            switch result {
            case .success(let response):
                self?.posts = response
                self?.displayPosts?(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func anotherfunc() {
        displayPosts?([])
    }
    
}
