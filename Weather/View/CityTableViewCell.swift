//
//  CityTableViewCell.swift
//  Weather
//
//  Created by Iliya Kuznetsov on 03.11.16.
//  Copyright © 2016 Iliya Kuznetsov. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!

    
    weak var viewModel: CityTableViewModal! {
        didSet {
            self.timeLabel.text = viewModel.time
            self.cityLabel.text = viewModel.city
            self.tempLabel.text = viewModel.temp
        }
    }
    

}
