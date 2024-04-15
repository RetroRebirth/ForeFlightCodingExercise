//
//  ViewController.swift
//  ForeFlightWeather
//
//  Created by chris on 4/15/24.
//  Copyright © 2024 chris. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var airportSearchBar: UISearchBar!
    @IBOutlet weak var airportTableView: UITableView!
    @IBOutlet weak var weatherTextView: UITextView!
    
    var airports:[String] = ["KPWM","KAUS"]
    var selectedAirport:String = ""
    var weatherString:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedAirport = airports[0]
        
        airportSearchBar.text = selectedAirport
        airportSearchBar.delegate = self
        
        airportTableView.delegate = self
        airportTableView.dataSource = self
        
        weatherTextView.editable = false
        
        parseWeather()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUIs() {
        airportSearchBar.text = selectedAirport
        airportTableView.reloadData()
        weatherTextView.text = weatherString
    }
    
    // MARK: UISearchBarDelegate
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        selectedAirport = airportSearchBar.text!
        
        if !airports.contains(selectedAirport) {
            airports.insert(selectedAirport, atIndex: 0)
        }
        
        parseWeather()
    }
    
    // MARK: UITableViewDataSource, UITableViewDelegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airports.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell;
        cell.textLabel?.text = airports[indexPath.row];
        
        return cell;
    }
    
    // MARK: NSURLSession
    
    func parseWeather(){
        guard let url = NSURL(string: "https://qa.foreflight.com/weather/report/"+selectedAirport) else{
            return
        }
        let urlRequest = NSMutableURLRequest(URL: url)
        urlRequest.addValue("1", forHTTPHeaderField: "ff-coding-exercise")
        
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(urlRequest){
            data, response, error in
        
            guard let data = data, let string = String(data: data, encoding: NSUTF8StringEncoding) else {
                return
            }
            
            self.weatherString = string
            dispatch_async(dispatch_get_main_queue(), {
                self.updateUIs()
            })
        }
        
        task.resume()
    }
}

