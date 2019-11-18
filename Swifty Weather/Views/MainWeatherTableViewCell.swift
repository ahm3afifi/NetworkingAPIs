//
//  MainWeatherTableViewCell.swift
//  Swifty Weather
//
//  Created by Ahmed Afifi on 11/11/19.
//  Copyright © 2019 Ahmed Afifi. All rights reserved.
//

import UIKit

class MainWeatherTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func generateCell(weatherData: CityTempData) {
        
        cityLabel.text = weatherData.city
        cityLabel.adjustsFontSizeToFitWidth = true
        tempLabel.text = String(format: "%.0f %@", weatherData.temp, returnTempFormatFromUserDefaults())
        //TODO: make temp format dynamic
    }

}
