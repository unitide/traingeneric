//
//  ViewController.swift
//  FirstApp
//
//  Created by Christian Quicano on 1/21/22.
//

import UIKit

// Access levels
// internal
// private
// public

class ViewController: UIViewController {

    @IBOutlet weak private var myLabel: UILabel?
    @IBOutlet weak private var nameLabel: UITextField!
    @IBOutlet weak private var ageLabel: UITextField!
    @IBOutlet weak private var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        print("viewDidLoad")


        myLabel?.text = "Title of my first App"
        

    }
    
    @IBAction private func mergeStrings(_ sender: UIButton) {
        
        //
        nameLabel.resignFirstResponder()
        ageLabel.resignFirstResponder()
        
        // add validation
        guard let name = nameLabel.text, let age = ageLabel.text, let _ = Int(age)
        else { return }
        
        // validate alphanumeric
        let characters = NSCharacterSet.alphanumerics.inverted
        guard name.rangeOfCharacter(from: characters) == nil
        else { return }
        
        // here
        let newString = "My name is: \(name) and my age is: \(age)"
        resultLabel.text = newString
    
        
//        if let name = nameLabel.text, let age = ageLabel.text {
//            let newString = "My name is: \(name) and my age is: \(age)"
//            resultLabel.text = newString
//            // some logic this logic is using the name and age
//        }
        
        
    }
    
}

