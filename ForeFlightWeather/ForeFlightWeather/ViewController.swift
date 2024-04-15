//
//  ViewController.swift
//  ForeFlightWeather
//
//  Created by chris on 4/15/24.
//  Copyright © 2024 chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var airportSearchBar: UISearchBar!
    
    var data = ["KPWM","KAUS"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        airportSearchBar.text = data[0]
        airportSearchBar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK:UISearchBarDelegate
    
//    // Managing the search text
//    
//    func searchBar(searchBar: UISearchBar, textDidChange: String) {
//        // TODO
//    }
//
//    func searchBar(searchBar: UISearchBar, shouldChangeTextIn: NSRange, replacementText: String) -> Bool {
//        // TODO
//        return false
//    }
//    
//    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
//        // TODO
//        return false
//    }
//    
//    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
//        // TODO
//    }
//    
//    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
//        // TODO
//        return false
//    }
//    
//    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
//        // TODO
//    }
//    
//    // Responding to clicks in search controls
//    
//    func searchBarBookmarkButtonClicked(searchBar: UISearchBar) {
//        // TODO
//    }
//    
//    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
//        // TODO
//    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        // TODO
        print(searchBar.text)
    }
    
//    func searchBarResultsListButtonClicked(searchBar: UISearchBar) {
//        // TODO
//    }
//    
//    // Responding to scope button changes
//    
//    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange: Int) {
//        // TODO
//    }
}

