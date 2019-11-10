//
//  WeatherLocation.swift
//  Swifty Weather
//
//  Created by Ahmed Afifi on 11/3/19.
//  Copyright © 2019 Ahmed Afifi. All rights reserved.
//

import Foundation

// added Equatable protocol to this struct to make it comparable
struct WeatherLocation: Codable, Equatable {
    
    var city: String!
    var country: String!
    var countryCode: String!
    var isCurrentLocation: Bool!
    
}
