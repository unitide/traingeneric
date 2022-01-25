//
//  MainViewController.swift
//  SegmentControl
//
//  Created by Christian Quicano on 1/24/22.
//

import UIKit

class MainViewController: UIViewController {
    
    private enum Dish: Int {
        case first
        case second
        case third
        
        var image: UIImage? {
            switch self {
            case .first:
                return UIImage(named: "first")
            case .second:
                return UIImage(named: "second")
            case .third:
                return UIImage(named: "third")
            }
        }
    }
    
    @IBOutlet private weak var segmentControl: UISegmentedControl!
    
    @IBOutlet private weak var imageView: UIImageView!
    
    @IBAction private func changeSegmentControl(_ sender: Any) {
        
        //1. know what is the option of the segment control
        let index = segmentControl.selectedSegmentIndex
        
        guard let segmentCase = Dish(rawValue: index)
        else { return }
        
        //2. change the image from the UIImageView
        imageView.image = segmentCase.image
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentControl.selectedSegmentIndex = 1
        imageView.image = Dish.second.image
    }
    
}
