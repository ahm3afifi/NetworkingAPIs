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
    let userDefault = UserDefaults.standard
    
    var locationsManager: CLLocationManager?
    var currentLocation: CLLocationCoordinate2D!
    
    var allLocations: [WeatherLocation] = []
    var allWeatherViews: [WeatherView] = []
    var allWeatherData: [CityTempData] = []
    
    
    
    //MARK: ViewLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManagerStart()
        weatherScrollView.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        locationAuthCheck()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        locationManagerStop()
    }
    
    
    //MARK: Download Weather
    
    private func getWeather() {
        loadLocationsFromUserDefault()
        createWeatherView()
        addWeatherToScrollView()
        setPageControlPageNumber()
    }
    
    
    private func createWeatherView() {
        for _ in allLocations {
            allWeatherViews.append(WeatherView())
        }
    }
    
    private func addWeatherToScrollView() {
        for i in 0..<allWeatherViews.count {
            let weatherView = allWeatherViews[i]
            let location = allLocations[i]
            
            getCurrentWeather(weatherView: weatherView, location: location)
            getHourlyWeather(weatherView: weatherView, location: location)
            getWeeklyWeather(weatherView: weatherView, location: location)
            
            let xPosition = self.view.frame.width * CGFloat(i)
            weatherView.frame = CGRect(x: xPosition, y: 0, width: weatherScrollView.bounds.width, height: weatherScrollView.bounds.height)
            
            weatherScrollView.addSubview(weatherView)
            weatherScrollView.contentSize.width = weatherView.frame.width * CGFloat(i + 1)
        }
    }
    
    private func getCurrentWeather(weatherView: WeatherView, location: WeatherLocation) {
        
        weatherView.currentWeather = CurrentWeather()
        weatherView.currentWeather.getCurrentWeather(location: location) { (success) in
        weatherView.refreshData()
        }
        
    }
    
    private func getWeeklyWeather(weatherView: WeatherView, location: WeatherLocation) {
        
        WeeklyWeatherForecast.downloadWeeklyWeatherForecast(location: location) { (weatherForecast) in
            weatherView.weeklyWeatherForecastData = weatherForecast
            weatherView.tableView.reloadData()
        }
        
    }
    
    private func getHourlyWeather(weatherView: WeatherView, location: WeatherLocation) {
        
        HourlyForecast.downloadHourlyForecastWeather(location: location) { (weatherForecast) in
            weatherView.dailyWeatherForecastData = weatherForecast
            weatherView.hourlyCollectionView.reloadData()
        }
        
    }
    
    
    
    //MARK: Load users from userDefault
    private func loadLocationsFromUserDefault() {
        
        let currentLocation = WeatherLocation(city: "", country: "", countryCode: "", isCurrentLocation: true)
        
        if let data = userDefault.value(forKey: "Locations") as? Data {
            allLocations = try! PropertyListDecoder().decode(Array<WeatherLocation>.self, from: data)
            allLocations.insert(currentLocation, at: 0)

        } else {
            print("no user data in user defaults")
            allLocations.append(currentLocation)
        }
    }
    
    
    //MARK: PageControl
    private func setPageControlPageNumber() {
        pageControl.numberOfPages = allWeatherViews.count
        
    }
    
    private func updatePageControlSelectedPage(currentPage: Int) {
        pageControl.currentPage = currentPage
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



extension WeatherViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x / scrollView.frame.size.width
        updatePageControlSelectedPage(currentPage: Int(round(value)))
    }
}
