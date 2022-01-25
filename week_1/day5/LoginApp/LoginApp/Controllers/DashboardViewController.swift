//
//  DashboardViewController.swift
//  LoginApp
//
//  Created by Christian Quicano on 1/25/22.
//

import UIKit

class DashboardViewController: UIViewController {

    var user: User?
    
    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = user?.name
        loadProfileImage()
    }
    
    private func loadProfileImage() {
        guard let urlS = user?.image, let url = URL(string: urlS)
        else { return }
        
        
        do {
            let data = try Data(contentsOf: url)
            profileImage.image = UIImage(data: data)
            profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        } catch (let error) {
            print(error.localizedDescription)
        }

        
    }

    
}

