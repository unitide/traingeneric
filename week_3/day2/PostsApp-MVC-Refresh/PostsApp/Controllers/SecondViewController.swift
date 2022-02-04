//
//  SecondViewController.swift
//  PostsApp
//
//  Created by Christian Quicano on 2/3/22.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    var posts: [Post] = []
    var rowSelected = 0
    
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    
    @IBAction private func displayNextTitle(_ sender: Any) {
        rowSelected += 1
        
        if rowSelected >= posts.count {
            rowSelected = 0
        }
        
        titleLabel.text = posts[rowSelected].title
        populateNameButton(rowSelected)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the txt of the title
        titleLabel.text = posts[rowSelected].title
        populateNameButton(rowSelected)
    }
    
    private func populateNameButton(_ currentIndex: Int) {
        let title = "Current: \(currentIndex) - see next"
        nextButton.setTitle(title, for: .normal)
    }
    
}
