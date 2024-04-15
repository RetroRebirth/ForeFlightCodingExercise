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
    
    var searchActive : Bool = false
    var data = ["KPWM","KAUS"]
    var filtered:[String] = []
    
    var weatherString:String = "testing this view"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Setup delegates */
        airportTableView.delegate = self
        airportTableView.dataSource = self
        airportSearchBar.delegate = self
        
        parseWeather()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUIs() {
        airportSearchBar.text = data[0];
        weatherTextView.text = weatherString
    }
    
    // MARK: UISearchBarDelegate
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
        
        updateUIs()
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        filtered = data.filter({ (text) -> Bool in
            let tmp: NSString = text
            let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return range.location != NSNotFound
        })
        if(filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.airportTableView.reloadData()
    }
    
    // MARK: UITableViewDataSource, UITableViewDelegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return filtered.count
        }
        return data.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell;
        if(searchActive){
            cell.textLabel?.text = filtered[indexPath.row]
        } else {
            cell.textLabel?.text = data[indexPath.row];
        }
        
        return cell;
    }
    
    // MARK: NSURLSession
    
    func parseWeather(){
        guard let url = NSURL(string: "https://qa.foreflight.com/weather/report/KPWM") else{
            return
        }
        let urlRequest = NSMutableURLRequest(URL: url)
        urlRequest.addValue("1", forHTTPHeaderField: "ff-coding-exercise")
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(urlRequest){
            data, response, error in
        
            if let data = data, let string = String(data: data, encoding: NSUTF8StringEncoding){
                print(string)
                self.weatherString = string
//                self.updateUIs()
            }
        }
        
        task.resume()
    }
}

