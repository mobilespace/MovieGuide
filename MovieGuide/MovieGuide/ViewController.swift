//
//  ViewController.swift
//  MovieGuide
//
//  Created by Monte with Pillow on 9/18/16.
//  Copyright © 2016 Monte Thakkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "MovieCell", forIndexPath: indexPath) as! MovieCell
        cell.titleLabel.text = "Suicide Squad"
        cell.posterImageView.image = UIImage(named: "martian2015-5")
        
        return cell
    }
}

