//
//  LastViewController.swift
//  Navigation
//
//  Created by Christian Quicano on 1/25/22.
//

import UIKit

class LastViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction private func dismissView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        //navigationController?.popViewController(animated: true)
    }
    
}
