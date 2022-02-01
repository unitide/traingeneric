//
//  ViewController.swift
//  MVPExample
//
//  Created by Christian Quicano on 1/31/22.
//

import UIKit

class ViewController: UIViewController {

    private var presenter: MoviePresenter!
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpUI()
        
        // configure presenter
        presenter = MoviePresenter(view: self)
        presenter.getMovies()
    }
    
    private func setUpUI() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}

extension ViewController: MovieViewProtocol {
    
    func resfreshTableView() {
        tableView.reloadData()
    }
    
    func displayError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "Done", style: .default, handler: nil)
        alert.addAction(doneButton)
        present(alert, animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell
//        else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
        
        let row = indexPath.row
        let title = presenter.getTitle(by: row)
        let overview = presenter.getOverview(by: row)
        let data = presenter.getImageData(by: row)
        cell.configureCell(title: title, overview: overview, data: data)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
