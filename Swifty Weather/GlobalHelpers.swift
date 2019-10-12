//
//  GlobalHelpers.swift
//  Swifty Weather
//
//  Created by Ahmed Afifi on 10/10/19.
//  Copyright © 2019 Ahmed Afifi. All rights reserved.
//

import Foundation

func currentDateFromUnix(unixDate: Double?) -> Date {
    
    if unixDate != nil {
        return Date(timeIntervalSince1970: unixDate!)
    } else {
        return Date()
    }
}
