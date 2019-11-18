//
//  GlobalHelpers.swift
//  Swifty Weather
//
//  Created by Ahmed Afifi on 10/10/19.
//  Copyright © 2019 Ahmed Afifi. All rights reserved.
//

import Foundation
import UIKit

func currentDateFromUnix(unixDate: Double?) -> Date {
    
    if unixDate != nil {
        return Date(timeIntervalSince1970: unixDate!)
    } else {
        return Date()
    }
}

func getWeatherIconFor(_ type: String) -> UIImage? {
    return UIImage(named: type)
}

func fahrenheitFrom(celsius: Double) -> Double {
    return (celsius * 9/5) + 32
}

func getTempBasedOnSettings(celsius: Double) -> Double {
    let format = returnTempFormatFromUserDefaults()
    
    if format == TempFormat.celsius {
        return celsius
    } else {
        return fahrenheitFrom(celsius: celsius)
    }
}

func returnTempFormatFromUserDefaults() -> String {
    
    if let tempFormat = UserDefaults.standard.value(forKey: "TempFormat") {
        
        if tempFormat as! Int == 0 {
            return TempFormat.celsius
        } else {
            return TempFormat.fahrenheit
        }
        
    } else {
        return TempFormat.celsius
    }
    
}
