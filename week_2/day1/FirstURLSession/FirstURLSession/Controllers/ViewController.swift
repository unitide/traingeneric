//
//  ViewController.swift
//  FirstURLSession
//
//  Created by Christian Quicano on 1/26/22.
//

import UIKit

class ViewController: UIViewController {

    private let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fetchPosts()
        fetchStories()
    }

    private func fetchPosts() {
        networkManager.getPosts(from: NetworkURLs.postsURL) { result in
            switch result {
            case .success(let response):
                let firstPost = response.first
                print(firstPost?.title)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func fetchStories() {
        networkManager.getStories(from: NetworkURLs.baseURLReddit) { result in
            switch result {
            case .success(let response):
                print(response.data.children.first?.data.title)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

