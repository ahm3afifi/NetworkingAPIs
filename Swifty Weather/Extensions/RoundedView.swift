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
        self.layer.cornerRadius = 12
//        self.layer.shadowRadius = 3
//        self.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
//        self.layer.shadowOpacity = 0.3
        self.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.5782052654)
    }

}
