//
//  ViewController.swift
//  FirstAPICall
//
//  Created by Christian Quicano on 1/26/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    private var counter: Int = 0
    private var array = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        activityIndicator.isHidden = true
    }
    
    @IBAction func displayCounter(_ sender: Any) {
        print(counter)
    }
    
    @IBAction private func getData() {
        print("Start get data...")
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        DispatchQueue.global().async {
            
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
            else { return }
            
            do {
                let data = try Data(contentsOf: url)
                
                // convert this data into a Dictionary
                if let response = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                    self.array = response
                }
                
                print(data)
                self.counter = data.count
            } catch let error {
                print(error.localizedDescription)
            }
            print("Finish get data...")
            
            DispatchQueue.main.async {
                self.activityIndicator.isHidden = true
                self.tableView.reloadData()
            }
            
        }
        
        
        
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // populate/ change data of cell
        let row = indexPath.row
        let dictionary = array[row]
        
        let title = dictionary["title"] as? String
        let body = dictionary["body"] as? String
        
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = body
        
        return cell
    }
}
