//
//  InfoCollectionViewCell.swift
//  Swifty Weather
//
//  Created by Ahmed Afifi on 11/2/19.
//  Copyright © 2019 Ahmed Afifi. All rights reserved.
//

import UIKit

class InfoCollectionViewCell: UICollectionViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var infoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func generatCell(weatherInfo: WeatherInfo) {
        
        infoLabel.text = weatherInfo.infoText
        infoLabel.adjustsFontSizeToFitWidth = true
        
        if weatherInfo.image != nil {
            nameLabel.isHidden = true
            infoImageView.isHidden = false
            infoImageView.image = weatherInfo.image
        } else {
            //No Image
            nameLabel.isHidden = false
            infoImageView.isHidden = true
            nameLabel.adjustsFontSizeToFitWidth = true
            nameLabel.text = weatherInfo.nameText
        }
        
    }

}
