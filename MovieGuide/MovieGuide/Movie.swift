//
//  Movie.swift
//  MovieGuide
//
//  Created by Monte with Pillow on 10/1/16.
//  Copyright © 2016 Monte Thakkar. All rights reserved.
//

import UIKit

let baseImageURL = "http://image.tmdb.org/t/p/w500"

class Movie: NSObject {
    
    var moviePosterUrl: NSURL?
    var movieTitle: String?
    var movieOverview: String?
    var movieBackdropPathUrl: NSURL?
    
    init(dictionary: NSDictionary) {
        
        if let moviePosterUrlString = dictionary["poster_path"] as? String {
            moviePosterUrl = NSURL(string: baseImageURL + moviePosterUrlString)!
        } else {
            moviePosterUrl = nil
        }
        
        if let movieBackdropPathString = dictionary["backdrop_path"] as? String {
            movieBackdropPathUrl = NSURL(string: baseImageURL + movieBackdropPathString)!
        } else {
            movieBackdropPathUrl = nil
        }
        
        self.movieTitle = dictionary["title"] as? String
        
        self.movieOverview = dictionary["overview"] as? String
    }
    
    class func movies(array: [NSDictionary]) -> [Movie] {
        var movies = [Movie]()
        
        for dictionary in array {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        return movies
    }

}
