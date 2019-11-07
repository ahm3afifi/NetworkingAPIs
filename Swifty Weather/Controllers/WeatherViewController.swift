//
//  WeatherViewController.swift
//  Swifty Weather
//
//  Created by Ahmed Afifi on 10/13/19.
//  Copyright © 2019 Ahmed Afifi. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var weatherScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    var weatherLocation: WeatherLocation!
    
    //MARK: ViewLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let weatherView = WeatherView()
        weatherView.frame = CGRect(x: 0, y: 0, width: weatherScrollView.bounds.width, height: weatherScrollView.bounds.height)
        weatherScrollView.addSubview(weatherView)
        
        weatherLocation = WeatherLocation(city: "Cairo", country: "Egypt", countryCode: "EG", isCurrentLocation: false)
        
        getCurrentWeather(weatherView: weatherView)
        getWeeklyWeather(weatherView: weatherView)
        getHourlyWeather(weatherView: weatherView)
        
    }
    
    
    //MARK: Download Weather
    
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
    
    

}
