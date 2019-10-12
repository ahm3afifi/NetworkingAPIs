//
//  ViewController.swift
//  Swifty Weather
//
//  Created by Ahmed Afifi on 9/29/19.
//  Copyright © 2019 Ahmed Afifi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        WeeklyWeatherForecast.downloadWeeklyWeatherForecast { (weeklyArray) in
            
            for forecast in weeklyArray {
                print("forecast info: \(forecast.date), \(forecast.temp), \(forecast.weatherIcon)")
            }
        }
        
    }


}

