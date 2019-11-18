//
//  ForecastCollectionViewCell.swift
//  Swifty Weather
//
//  Created by Ahmed Afifi on 11/2/19.
//  Copyright © 2019 Ahmed Afifi. All rights reserved.
//

import UIKit

class ForecastCollectionViewCell: UICollectionViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func generateCell(weather: HourlyForecast) {
        timeLabel.text = weather.date.time()
        timeLabel.adjustsFontSizeToFitWidth = true
        weatherIconImageView.image = getWeatherIconFor(weather.weatherIcon)
        tempLabel.text = String(format: "%.0f%@", weather.temp, returnTempFormatFromUserDefaults())
        
        
    }

}
