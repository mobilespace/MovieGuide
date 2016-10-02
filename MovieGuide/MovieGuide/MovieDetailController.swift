//
//  MovieDetailController.swift
//  MovieGuide
//
//  Created by Monte with Pillow on 10/1/16.
//  Copyright © 2016 Monte Thakkar. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailController: UIViewController {
    
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = movie?.movieTitle
        self.overviewLabel.text = movie?.movieOverview
        
        if(movie?.movieBackdropPathUrl != nil) {
            backdropImageView.af_setImageWithURL(NSURL(string: movie!.movieBackdropPathUrl!)!)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
