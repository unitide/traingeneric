//
//  ViewController.swift
//  LoginApp
//
//  Created by Christian Quicano on 1/25/22.
//

import UIKit

class ViewController: UIViewController {

    private var user: User?
    
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameTextField.text = nil
        passwordTextField.text = nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let identifier = segue.identifier
        if identifier == "showMainApp" {
            if let destination = segue.destination as? UITabBarController {
                if let viewController = destination.viewControllers?.first as? DashboardViewController {
                    viewController.user = user
                }
            }
        }
        
    }

    @IBAction private func login(_ sender: Any) {
        guard let username = usernameTextField.text,
                let password = passwordTextField.text,
              !username.isEmpty,
              !password.isEmpty
        else {
            let errorAlert = createErrorAlert("Need an username and password")
            present(errorAlert, animated: true, completion: nil)
            return
        }
        
        // send those params to an API
        guard username == "cquicano", password == "123456"
        else {
            let errorAlert = createErrorAlert("username and password is not correct")
            present(errorAlert, animated: true, completion: nil)
            return
        }
        
        // user
        user = User(username: username, name: "Christian Quicaño", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS54088iJjHpn-y9FCxGAh5NBEdHugwIXewWQ&usqp=CAU")
        
        performSegue(withIdentifier: "showMainApp", sender: nil)
        
    }
    
    private func createErrorAlert(_ message: String) -> UIAlertController {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let acceptButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(acceptButton)
        return alert
    }
    
}

