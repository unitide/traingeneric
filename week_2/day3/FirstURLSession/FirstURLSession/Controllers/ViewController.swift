//
//  ViewController.swift
//  FirstURLSession
//
//  Created by Christian Quicano on 1/26/22.
//

import UIKit

class ViewController: UIViewController {

    private let networkManager = NetworkManager()
    private let postsService = PostsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fetchPosts()
        fetchStories()
    }

    private func fetchPosts() {
        // without generic
        networkManager.getPosts(from: NetworkURLs.postsURL) { result in
            switch result {
            case .success(let response):
                let firstPost = response.first
                print(firstPost?.title)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
        // with generic
        networkManager.getModel([Post].self, from: NetworkURLs.postsURL) { result in
            switch result {
            case .success(let response):
                let firstPost = response.first
                print(firstPost?.title)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        // using service
//        postsService.getModel(from: <#T##String#>, completion: <#T##(Result<[Post], NetworkError>) -> Void#>)
        
    }
    
    private func fetchStories() {
        // without generic
        networkManager.getStories(from: NetworkURLs.baseURLReddit) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
        // with generic
        networkManager.getModel(RedditResponse.self, from: NetworkURLs.baseURLReddit) { result in
            switch result {
            case .success(let response):
                print(response.data.children.first?.data.fullname)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

