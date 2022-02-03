//
//  ViewController.swift
//  PostsApp
//
//  Created by Christian Quicano on 2/3/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private var posts = [Post]()
    private let networkManager = NetworkManager()
    private var rowSelected = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpUI ()
        fetchData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let destination = segue.destination as? SecondViewController
            destination?.posts = posts
            destination?.rowSelected = rowSelected
        }
    }
    
    private func setUpUI () {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func fetchData() {
        networkManager.fetchData { [weak self] array in
            self?.posts = array
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
        }
    }


}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowSelected = indexPath.row
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let post = posts[row]
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.overview
        return cell
        
    }
    
}
