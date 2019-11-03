//
//  Extensions.swift
//  Swifty Weather
//
//  Created by Ahmed Afifi on 10/22/19.
//  Copyright © 2019 Ahmed Afifi. All rights reserved.
//

import Foundation

extension Date {
    
    func shortDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d"
        return dateFormatter.string(from: self)
        
    }
    
    func time() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH : mm"
        return dateFormatter.string(from: self)
        
    }
    
    func dayOfTheWeek() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
        
    }
    
}
