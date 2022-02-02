//
//  ViewModelCombine.swift
//  CommunicationExamples
//
//  Created by Christian Quicano on 2/2/22.
//

import Foundation
import Combine

class ViewModelCombine {
    
    private let networkManager = NetworkManagerCombine()
    private var cancellers = Set<AnyCancellable>()
    
    @Published var posts = [Post]()
    
    func getPost() {
        networkManager
            .getPosts(from: NetworkURLs.postsURL)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] response in
                self?.posts = response
            })
            .store(in: &cancellers)
    }
    
    func filterPost() {
        posts = []
    }
}
