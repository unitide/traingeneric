//
//  ViewController.swift
//  TableViewExample
//
//  Created by Christian Quicano on 1/24/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private var array = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 20
        }
        if section == 1 {
            return 10
        }
        return 30
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "First Section"
        }
        if section == 1 {
            return "Second section"
        }
        return "Third section"
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        let section = indexPath.section
        
        let title = "Section: \(section)"
        let subtitle = "Row: \(row)"
        
        if section == 0 && row == 3 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell {
                
                let largeString = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."
                
                cell.configureCell(title: largeString, buttonTitle: subtitle, row: row)
                cell.delegate = self
                return cell
            }
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = subtitle
        return cell
    }
    
}

extension ViewController: CustomCellDelegate {
    func tap(on row: Int) {
        print(row)
        // display a different screen
        // open a browser
        // send an email
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let row = indexPath.row
        let section = indexPath.section
        
        if section == 0 && row == 3 {
            return UITableView.automaticDimension
        }
        
        return 45.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let section = indexPath.section
        print("Section: \(section), Row: \(row)")
    }
    
}
