//
//  WeeklyWeatherForecast.swift
//  Swifty Weather
//
//  Created by Ahmed Afifi on 10/12/19.
//  Copyright © 2019 Ahmed Afifi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeeklyWeatherForecast {

    private var _date: Date!
    private var _temp: Double!
    private var _weatherIcon: String!
    
    var date: Date {
        if _date == nil {
            _date = Date()
        }
        return _date
    }
    
    var temp: Double {
        if _temp == nil {
            _temp = 0.0
        }
        return _temp
    }
    
    var weatherIcon: String {
        if _weatherIcon == nil {
            _weatherIcon = ""
        }
        return _weatherIcon
    }
    
    
    init(weatherDictionary: Dictionary<String, AnyObject>) {
        
        let json = JSON(weatherDictionary)
        
        self._temp = json["temp"].double
        self._date = currentDateFromUnix(unixDate: json["ts"].double!)
        self._weatherIcon = json["weather"]["icon"].stringValue
        
    }
    
    
    class func downloadWeeklyWeatherForecast(completion: @escaping (_ weatherForecast: [WeeklyWeatherForecast]) -> Void) {
        
        let WEEKLYFORECAST_URL = "https://api.weatherbit.io/v2.0/forecast/daily?city=Cairo,EG&days=7&key=f3da95f3913d4b8c9f45ba4eea5e3225"
        
        Alamofire.request(WEEKLYFORECAST_URL).responseJSON { (response) in
            
            let result = response.result
            var forecastArray: [WeeklyWeatherForecast] = []
            
            if result.isSuccess {
                
                if let dictionary = result.value as? Dictionary<String, AnyObject> {
                    if var list = dictionary["data"] as? [Dictionary<String, AnyObject>] {
                        
                        list.remove(at: 0) // Remove Current Day
                        print("Number of days: ", list.count)
                        
                        for item in list {
                            let forecast = WeeklyWeatherForecast(weatherDictionary: item)
                            forecastArray.append(forecast)
                        }
                        
                    }
                }

                print("weekly data:", result.value)
                completion(forecastArray)
            } else {
                completion(forecastArray)
                print("No weekly data")
            }
        }
        
    }

}
