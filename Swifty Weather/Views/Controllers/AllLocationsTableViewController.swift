//
//  AllLocationsTableViewController.swift
//  Swifty Weather
//
//  Created by Ahmed Afifi on 11/5/19.
//  Copyright © 2019 Ahmed Afifi. All rights reserved.
//

import UIKit

class AllLocationsTableViewController: UITableViewController {
    
    //MARK: Variables
    let userDefaults = UserDefaults.standard
    var savedLocations: [WeatherLocation]?
    var weatherData: [CityTempData]?
    
    
    
    //MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFromUserDefaults()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherData?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationsCell", for: indexPath) as! MainWeatherTableViewCell
        
        if weatherData != nil {
            cell.generateCell(weatherData: weatherData![indexPath.row])
        }

        return cell
    }
    
    
    
    //MARK: TableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // This means we don't want to edit the first cell because it's the current location
        return indexPath.row != 0
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let locationToDelete = weatherData?[indexPath.row]
            weatherData?.remove(at: indexPath.row)
            
            removeLocationFromSavedLocations(location: locationToDelete!.city)
            tableView.reloadData()
        }
    }
    
    private func removeLocationFromSavedLocations(location: String) {
        
        if savedLocations != nil {
            for i in 0..<savedLocations!.count {
                let tempLocation = savedLocations![i]
                if tempLocation.city == location {
                    savedLocations!.remove(at: i)
                    saveNewLocationToUserDefaults()
                    return
                }
            }
        }
    }

    private func saveNewLocationToUserDefaults() {
        userDefaults.set(try? PropertyListEncoder().encode(savedLocations!), forKey: "Locations")
        userDefaults.synchronize()
    }
    

    //MARK: UserDefaults
    private func loadFromUserDefaults() {
        if let data = userDefaults.value(forKey: "Locations") as? Data {
            savedLocations = try? PropertyListDecoder().decode(Array<WeatherLocation>.self, from: data)
        }
    }
    
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chooseLocationSeg" {
            let vc = segue.destination as! ChooseCityViewController
            vc.delegate = self
        }
    }

    
}


extension AllLocationsTableViewController: ChooseCityViewControllerDelegate {
    func didAdd(newLocation: WeatherLocation) {
        print("We have added new location", newLocation.country, newLocation.city
        )
    }
    
    
    
}
