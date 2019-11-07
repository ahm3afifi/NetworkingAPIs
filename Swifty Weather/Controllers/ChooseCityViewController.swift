//
//  ChooseCityViewController.swift
//  Swifty Weather
//
//  Created by Ahmed Afifi on 11/5/19.
//  Copyright © 2019 Ahmed Afifi. All rights reserved.
//

import UIKit

class ChooseCityViewController: UIViewController {

    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Variables
    var allLocations: [WeatherLocation] = []
    var filteredLocations: [WeatherLocation] = []
    
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.tableFooterView = searchController.searchBar
        
        setupSearchController()
        tableView.tableHeaderView = searchController.searchBar
        
        loadLocationsFromCSV()

    }
    
    
    private func setupSearchController() {
        searchController.searchBar.placeholder = "City or Country"
        searchController.searchResultsUpdater = self
//        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        
        searchController.searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchController.searchBar.sizeToFit()
        searchController.searchBar.backgroundImage = UIImage()
    }

    //MARK: Get Locations
    private func loadLocationsFromCSV() {
        
        if let path = Bundle.main.path(forResource: "location", ofType: "csv") {
            parseCSVAt(url: URL(fileURLWithPath: path))
        }
    }
    
    // parsing CSV file
    private func parseCSVAt(url: URL) {
        
        do {
            
            let data = try Data(contentsOf: url)
            let dataEncoded = String(data: data, encoding: .utf8)
            
            if let dataArr = dataEncoded?.components(separatedBy: "\n").map({ $0.components(separatedBy: ",")}) {
                
                var i = 0
                
                for line in dataArr {
                    print(line, "\n")

                    if line.count > 2 && i != 0 {
                        
                    }
                    
                    i += 1
                    
                }
            }
        } catch {
            print("Error reading CSV file, ", error.localizedDescription)
        }
        
    }
    
    private func createLocation(line: [String]) {
        
        allLocations.append(WeatherLocation(city: line.first!, country: line[1], countryCode: line.last!, isCurrentLocation: false))
        print(allLocations.count)
    }
    
}


extension ChooseCityViewController: UISearchResultsUpdating {
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
       
        filteredLocations = allLocations.filter({ (location) -> Bool in
            
            return location.city.lowercased().contains(searchText.lowercased()) || location.country.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}


extension ChooseCityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredLocations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let location = filteredLocations[indexPath.row]
        cell.textLabel?.text = location.city
        cell.detailTextLabel?.text = location.country
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Save Location
    }
    
    
}
