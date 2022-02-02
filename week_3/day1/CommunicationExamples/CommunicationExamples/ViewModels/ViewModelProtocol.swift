//
//  ViewModelProtocol.swift
//  CommunicationExamples
//
//  Created by Christian Quicano on 2/2/22.
//

import Foundation

protocol ViewModelProtocolDelegate: AnyObject {
    func displayPosts(_ posts: [Post])
}

class ViewModelProtocol {
    
    weak var delegate: ViewModelProtocolDelegate?
    private let networkManager = NetworkManagerClosure()
    
    func getPost() {
        networkManager.getModel([Post].self,
                                from: NetworkURLs.postsURL) { [weak self] result in
            switch result {
            case .success(let response):
                self?.delegate?.displayPosts(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func anotherFunc() {
        delegate?.displayPosts([])
    }
    
    func getPostWithoutThread() -> Int {
        let url = URL(string: NetworkURLs.postsURL)!
        let data = try! Data(contentsOf: url)
        let response = try! JSONDecoder().decode([Post].self, from: data)
        return response.count
    }
    
}
