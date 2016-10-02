//
//  MovieCell.swift
//  MovieGuide
//
//  Created by Monte with Pillow on 9/18/16.
//  Copyright © 2016 Monte Thakkar. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var movie : Movie! {
        didSet {
            titleLabel.text = movie.movieTitle
            
            print(movie)
            
            if let moviePath = movie.moviePosterUrl {
                posterImageView.af_setImageWithURL(moviePath)
                print("HERE \(moviePath)")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
