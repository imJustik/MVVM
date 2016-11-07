//
//  StartViewModel.swift
//  Weather
//
//  Created by Iliya Kuznetsov on 03.11.16.
//  Copyright © 2016 Iliya Kuznetsov. All rights reserved.
//

class StartViewModel {
    weak var weatherManager: WeatherManager!
    fileprivate var cellsArray = [CityTableViewModal]() //TableCell
    fileprivate var weatherArray: [Weather]!
    var detailsViewModel: DetailViewModal!
    
    func updateWeather(_ completion: @escaping () -> Void) {
        cellsArray.removeAll()
        weatherManager.getWeather { (weatherArray) in
            self.weatherArray = weatherArray
            for weatherObject in weatherArray {
                self.cellsArray.append(CityTableViewModal(weather: weatherObject))
            }
            completion()
        }
    }
    
    func numberOfCities() -> Int {
        return cellsArray.count
    }
    
    func cellViewModel(_ index: Int) -> CityTableViewModal? {
        guard index < cellsArray.count else {return nil}
        return cellsArray[index]
    }
    
    func detailsViewModel(_ index: Int) ->DetailViewModal {
        self.detailsViewModel = DetailViewModal(weather: weatherArray[index])
        return self.detailsViewModel
    }
    
    required init(weatherManager: WeatherManager) {
        self.weatherManager = weatherManager
    }
}
