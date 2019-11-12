//
//  WeatherViewController.swift
//  Swifty Weather
//
//  Created by Ahmed Afifi on 10/13/19.
//  Copyright © 2019 Ahmed Afifi. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var weatherScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    //MARK: Variables
    var weatherLocation: WeatherLocation!
    var locationsManager: CLLocationManager?
    var currentLocation: CLLocationCoordinate2D!
    
    
    
    //MARK: ViewLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManagerStart()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
       /* let weatherView = WeatherView()
        weatherView.frame = CGRect(x: 0, y: 0, width: weatherScrollView.bounds.width, height: weatherScrollView.bounds.height)
        weatherScrollView.addSubview(weatherView)
        
        weatherLocation = WeatherLocation(city: "Cairo", country: "Egypt", countryCode: "EG", isCurrentLocation: false)
        
        getCurrentWeather(weatherView: weatherView)
        getWeeklyWeather(weatherView: weatherView)
        getHourlyWeather(weatherView: weatherView) */
        
    }
    
    
    //MARK: Download Weather
    
    private func getWeather() {
        
    }
    
    private func getCurrentWeather(weatherView: WeatherView) {
        
        weatherView.currentWeather = CurrentWeather()
        weatherView.currentWeather.getCurrentWeather(location: weatherLocation) { (success) in
            weatherView.refreshData()
        }
        
    }
    
    private func getWeeklyWeather(weatherView: WeatherView) {
        
        WeeklyWeatherForecast.downloadWeeklyWeatherForecast(location: weatherLocation) { (weatherForecast) in
            weatherView.weeklyWeatherForecastData = weatherForecast
            weatherView.tableView.reloadData()
        }
        
    }
    
    private func getHourlyWeather(weatherView: WeatherView) {
        
        HourlyForecast.downloadHourlyForecastWeather(location: weatherLocation) { (weatherForecast) in
            weatherView.dailyWeatherForecastData = weatherForecast
            weatherView.hourlyCollectionView.reloadData()
        }
        
    }
    
    
    
    
    //MARK: Location Manager
    private func locationManagerStart() {
        
        if locationsManager == nil {
            locationsManager = CLLocationManager()
            locationsManager!.desiredAccuracy = kCLLocationAccuracyBest
            locationsManager!.requestWhenInUseAuthorization()
            locationsManager!.delegate = self
        }
        
        locationsManager!.startMonitoringSignificantLocationChanges()
    }

    private func locationManagerStop() {
        if locationsManager != nil {
            locationsManager!.stopMonitoringSignificantLocationChanges()
        }
    }
    
    private func locationAuthCheck() {
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            
            currentLocation = locationsManager!.location?.coordinate
            
            if currentLocation != nil {
                LocationService.shared.latitude = currentLocation.latitude
                LocationService.shared.longitude = currentLocation.longitude

                getWeather()
            } else {
                locationAuthCheck()
            }
        } else {
            locationsManager?.requestWhenInUseAuthorization()
            locationAuthCheck()
        }
    }
}




extension WeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get location, \(error.localizedDescription)")
    }
}
