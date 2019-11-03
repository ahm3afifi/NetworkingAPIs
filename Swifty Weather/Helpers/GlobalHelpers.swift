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
