//
//  DetailViewController.swift
//  Weather
//
//  Created by Iliya Kuznetsov on 04.11.16.
//  Copyright © 2016 Iliya Kuznetsov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windDirectionLabel: UILabel!
    @IBOutlet weak var precLabel: UILabel!
    
    weak var viewModal: DetailViewModal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityLabel.text = viewModal.city
        temperatureLabel.text = viewModal.temperature
        timeLabel.text = viewModal.time
        windSpeedLabel.text = viewModal.windSpeed
        windDirectionLabel.text = viewModal.windDirection
        precLabel.text = viewModal.precipition
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
