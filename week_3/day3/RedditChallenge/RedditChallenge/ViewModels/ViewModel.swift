//
//  ViewModel.swift
//  RedditChallenge
//
//  Created by Christian Quicano on 2/4/22.
//

import Foundation
import Combine

class ViewModel {
    
    private let networkManager = NetworkManager()
    private var after = ""
    private var isLoading = false
    @Published private(set) var stories = [Story]()
    
    func getStories() {
        loadMoreStories()
    }
    
    func loadMoreStories() {
        
        var newURL = NetworkURLs.baseURL
        if !after.isEmpty {
            newURL.append(contentsOf: "?after=\(after)")
        }
        
        guard !isLoading else { return }
        isLoading = true
        print(newURL)
        
        networkManager
            .getModel(RedditResponse.self, from: newURL) { [weak self] result in
                switch result {
                case .success(let response):
                    
                    let children = response.data.children
                    var stories = [Story]()
                    for child in children {
                        stories.append(child.data)
                    }
                    self?.stories.append(contentsOf: stories)
                    self?.after = response.data.after
                    self?.isLoading = false
                    
                    
                    //self?.stories = response.data.children.map { $0.data }
                    
                case .failure(let error):
                    self?.isLoading = false
                    print(error.localizedDescription)
                }
            }
    }
    
    func getTitle(by row: Int) -> String {
        let story = stories[row]
        return story.title.uppercased()
    }
    
}
