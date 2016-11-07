//
//  WeatherManager.swift
//  Weather
//
//  Created by Iliya Kuznetsov on 03.11.16.
//  Copyright © 2016 Iliya Kuznetsov. All rights reserved.
//

import Foundation
import Alamofire
class WeatherManager {
    func getWeather(_ completion: @escaping ([Weather]) -> Void) {
        responce(completion)
    }
    
    
    fileprivate func responce(_ completion: @escaping ([Weather]) -> Void) {
        var array = [Weather]()
        
        Alamofire.request(String(format:"http://api.openweathermap.org/data/2.5/group?id=%@,%@,%@&units=metric&appid=aa49b0c9ab3c60b38f40c2ebf0b391e4",CityId.Moscow.rawValue,CityId.LA.rawValue
            ,CityId.NY.rawValue)).responseJSON {response in
                let resultJSON: NSDictionary = response.result.value as! NSDictionary
                let list = resultJSON["list"] as! NSArray
                for city in list {
                    let cityData = city as! NSDictionary
                    let city = cityData["name"] as! String
                    let temp = (cityData["main"] as! NSDictionary)["temp"] as! Float
                    let windSpeed = (cityData["wind"] as! NSDictionary)["speed"] as! Float
                    array.append(self.weatherObject(temp, city: city, precipitation: .cloudly, windSpeed: Float(windSpeed), windDirection: .north))
                }
            DispatchQueue.main.async(execute: {completion(array) })
        }
        
        
    }
    
    
    fileprivate  func weatherObject(_ temperature:Float, city: String, precipitation: Precipitation, windSpeed: Float, windDirection: WindDirection) -> Weather {
        var weather = Weather()
        weather.temperature = temperature
        weather.city = city
        weather.precipition = precipitation
        weather.windSpeed = windSpeed
        weather.windDirection = windDirection
        weather.timestaml = Date().timeIntervalSince1970
        
        return weather
    }
}
