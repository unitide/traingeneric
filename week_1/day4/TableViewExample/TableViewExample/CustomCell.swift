//
//  CustomCell.swift
//  TableViewExample
//
//  Created by Christian Quicano on 1/24/22.
//

import UIKit

protocol CustomCellDelegate: AnyObject {
    func tap(on row: Int)
}

class CustomCell: UITableViewCell {

    weak var delegate: CustomCellDelegate?
    
    static let identifier = "CustomCell"
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    private var rowSelected = 0
    
    @IBAction func clickButton(_ sender: Any) {
        delegate?.tap(on: rowSelected)
    }
    
    func configureCell(title: String?, buttonTitle: String?, row: Int) {
        titleLabel.text = title
        button.setTitle(buttonTitle, for: .normal)
        rowSelected = row
    }
    
}
