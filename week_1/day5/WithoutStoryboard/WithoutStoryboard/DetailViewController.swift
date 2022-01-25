//
//  DetailViewController.swift
//  WithoutStoryboard
//
//  Created by Christian Quicano on 1/25/22.
//

import UIKit

class DetailViewController: UIViewController {

    private let user: User
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        print(user.name)
    }

}
