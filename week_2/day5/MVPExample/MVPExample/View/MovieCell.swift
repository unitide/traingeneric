//
//  MovieCell.swift
//  MVPExample
//
//  Created by Christian Quicano on 2/1/22.
//

import UIKit

class MovieCell: UITableViewCell {

    static let identifier = "MovieCell"
    
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var mainStackView: UIStackView!
    @IBOutlet private weak var movieOverviewLabel: UILabel!
    
    func configureCell(title: String?, overview: String?, data: Data?) {
        
        movieTitleLabel.text = title
        movieOverviewLabel.text = overview
        
        if let imageData = data {
            movieImageView.image = UIImage(data: imageData)
        }
        
    }
}
