//
//  RoundedView.swift
//  Swifty Weather
//
//  Created by Ahmed Afifi on 11/7/19.
//  Copyright © 2019 Ahmed Afifi. All rights reserved.
//

import UIKit

class RoundedView: UIView {

    override func awakeFromNib() {
        self.layer.cornerRadius = 7
//        self.layer.shadowRadius = 3
//        self.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
//        self.layer.shadowOpacity = 0.3
        self.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }

}
