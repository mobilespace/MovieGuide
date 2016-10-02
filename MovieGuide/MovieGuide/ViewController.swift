//
//  ViewController.swift
//  MovieGuide
//
//  Created by Monte with Pillow on 9/18/16.
//  Copyright © 2016 Monte Thakkar. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift
import Realm

let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
let realmObject = try! Realm()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var movies: [Movie]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let realmObject = try! Realm()
        
        //Realm db path: DEBUG
        print(Realm.Configuration.defaultConfiguration.description)
        
        let dbMovies = realmObject.objects(Movie.self)
        
        if dbMovies.count > 0 {
            print("Found movies in DB")
            var newMoviesArray = [Movie]()
            for movie in dbMovies {
                newMoviesArray.append(movie)
            }
            movies = newMoviesArray
        } else {
            //make API call and save data in the realm db
            makeAPICall()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "MovieCell", forIndexPath: indexPath) as! MovieCell
        cell.movie = movies![indexPath.row]
        
        return cell
    }
    
    func makeAPICall() {
        Alamofire.request(.GET, "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)").responseJSON { response in
            if let json = response.result.value {
                if let status_code = json["status_code"] as? Int {
                    print("ERROR: Unable to hit the API with status code: \(status_code)")
                    print("Got status message: \(json["status_message"] as! String)")
                }
                else {
                    print("Connection to API successful!")
                    self.movies = Movie.movies((json["results"] as? [NSDictionary])!)
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPathForCell(cell)
        let movie = movies![indexPath!.row]
        
        let movieDetailController = segue.destinationViewController as! MovieDetailController
        
        movieDetailController.movie = movie
    }

}

