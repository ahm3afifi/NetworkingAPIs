//
//  WeatherView.swift
//  Swifty Weather
//
//  Created by Ahmed Afifi on 10/14/19.
//  Copyright © 2019 Ahmed Afifi. All rights reserved.
//

import UIKit

class WeatherView: UIView {


    //MARK: IBOutlets
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherInfoLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bottomContainer: UIView!
    @IBOutlet weak var hourlyCollectionView: UICollectionView!
    @IBOutlet weak var infoCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrolllView: UIScrollView!
    
    //MARK: Variables
    var currentWeather: CurrentWeather!
    
    //MARK: Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        mainInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        mainInit()
    }
    
    private func mainInit() {
        
        Bundle.main.loadNibNamed("WeatherView", owner: self, options: nil)
        addSubview(mainView)
        mainView.frame = self.bounds
        mainView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        setupTableView()
        setupHourlyCollectionView()
        setupInfoCollectionView()
    }
    
    private func setupTableView() {
        
        
    }
    
    private func setupHourlyCollectionView() {
        
        
    }
    
    private func setupInfoCollectionView() {
        
        
    }
    
    func refreshData() {
        
        setupCurrentWeather()
        
    }
    
    private func setupCurrentWeather() {
        
        cityNameLabel.text = currentWeather.city
        dateLabel.text = "Today, \(currentWeather.date.shortDate())"
        tempLabel.text = "\(currentWeather.currentTemp)"
        weatherInfoLabel.text = currentWeather.weatherType
        
    }
    
}
