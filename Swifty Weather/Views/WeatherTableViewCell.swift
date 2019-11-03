//
//  WeatherTableViewCell.swift
//  Swifty Weather
//
//  Created by Ahmed Afifi on 11/2/19.
//  Copyright © 2019 Ahmed Afifi. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var dayOfTheWeekLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func generateCell(forecast: WeeklyWeatherForecast) {
        
        dayOfTheWeekLabel.text = forecast.date.dayOfTheWeek()
        weatherIconImageView.image = getWeatherIconFor(forecast.weatherIcon)
        tempLabel.text = "\(forecast.temp)"
        
    }
    
}
