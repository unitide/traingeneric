//
//  ViewController.swift
//  CommunicationExamples
//
//  Created by Christian Quicano on 2/2/22.
//

import UIKit
import Combine

class ViewController: UIViewController {

    private let viewModelProtocol = ViewModelProtocol()
    private let viewModelClosure = ViewModelClosure()
    
    private let viewModelCombine = ViewModelCombine()
    private var subscribers = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpProtocol()
        setUpClosure()
        setUpBinding()
    }

    private func setUpProtocol() {
        viewModelProtocol.delegate = self
        viewModelProtocol.getPost()
        
        let totalPosts = viewModelProtocol.getPostWithoutThread()
        print("totalPosts: \(totalPosts)")
        
    }
    
    private func setUpClosure() {
        viewModelClosure.displayPosts = { response in
            
            print("closure")
            print(response.count)
        }
        viewModelClosure.getPost()
        viewModelClosure.anotherfunc()
    }

    private func setUpBinding() {
        viewModelCombine
            .$posts
            .dropFirst()
            .receive(on: RunLoop.main)
            .sink(receiveValue: { posts in
                print("from publisher")
                print(posts.count)
            })
            .store(in: &subscribers)
        viewModelCombine.getPost()
    }
    
}

extension ViewController: ViewModelProtocolDelegate {
    func displayPosts(_ posts: [Post]) {
        print("from view controller")
        print(posts.count)
    }
}
