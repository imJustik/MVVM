import Foundation
import UIKit

class CityTableViewModal {
    let temp: String!
    let city: String!
    let time: String!

    
    required init(weather:Weather) { //подготовка данных
        self.city = weather.city
        self.temp = String(format:"%0.f%@", weather.temperature, "\u{00B0}")
        let df = DateFormatter()
        let date = Date(timeIntervalSince1970: weather.timestaml)
        df.dateFormat = "HH:mm"
        self.time = df.string(from: date)
        
    }
}
