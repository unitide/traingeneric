//
//  UserSettingTableViewController.swift
//  LoginApp
//
//  Created by Christian Quicano on 1/25/22.
//

import UIKit

class UserSettingTableViewController: UITableViewController {

    private let logoutRow = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row = indexPath.row
        
        if row == logoutRow {
            dismiss(animated: true, completion: nil)
        }
    }

}
