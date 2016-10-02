//
//  Movie.swift
//  MovieGuide
//
//  Created by Monte with Pillow on 10/1/16.
//  Copyright © 2016 Monte Thakkar. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

let baseImageURL = "http://image.tmdb.org/t/p/w500"

class Movie: Object {
    
    dynamic var moviePosterUrl: String? = nil
    dynamic var movieTitle: String? = nil
    dynamic var movieOverview: String? = nil
    dynamic var movieBackdropPathUrl: String? = nil
    
    class func newMovie(dictionary: NSDictionary) -> Movie {
        
        let movie = Movie()
        
        if let moviePosterUrlString = dictionary["poster_path"] as? String {
            movie.moviePosterUrl = baseImageURL + moviePosterUrlString
        } else {
            movie.moviePosterUrl = nil
        }
        
        if let movieBackdropPathString = dictionary["backdrop_path"] as? String {
            movie.movieBackdropPathUrl = baseImageURL + movieBackdropPathString
        } else {
            movie.movieBackdropPathUrl = nil
        }
        
        movie.movieTitle = dictionary["title"] as? String
        
        movie.movieOverview = dictionary["overview"] as? String
        
        return movie
    }
    
    class func movies(array: [NSDictionary]) -> [Movie] {
        var movies = [Movie]()
        
        for dictionary in array {
            let movie = newMovie(dictionary)
            
            //write the settings object to db for persistence
            try! realmObject.write() {
                realmObject.add(movie)
                
                print("New Movie saved with name: \(movie.movieTitle)")
                movies.append(movie)
            }
        }
        return movies
    }

}
