//
//  APIUrls.swift
//  
//
//  Created by Ahmed Afifi on 11/3/19.
//

import Foundation


let CURRENTLOCATION_URL = "https://api.weatherbit.io/v2.0/current?&lat=\(LocationService.shared.latitude!)&lon=\(LocationService.shared.longitude!)&key=f3da95f3913d4b8c9f45ba4eea5e3225"
let CURRENTLOCATIONWEEKLYFORECAST_URL = "https://api.weatherbit.io/v2.0/forecast/daily?lat=\(LocationService.shared.latitude!)&lon=\(LocationService.shared.longitude!)&days=7&key=f3da95f3913d4b8c9f45ba4eea5e3225"
let CURRENTLOCATIONHOURLYFORECAST_URL = "https://api.weatherbit.io/v2.0/forecast/hourly?lat=\(LocationService.shared.latitude!)&lon=\(LocationService.shared.longitude!)&hours=24&key=f3da95f3913d4b8c9f45ba4eea5e3225"

