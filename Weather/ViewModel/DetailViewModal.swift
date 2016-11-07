
import Foundation

class DetailViewModal {
    
    let city: String
    let temperature: String
    let time: String
    let windSpeed: String
    let windDirection: String
    let precipition: String
    
    required init (weather: Weather) {
        city = weather.city
        temperature = String(format: "%0.f%@", weather.temperature, "C")
        let df = DateFormatter()
        let date = Date(timeIntervalSince1970: weather.timestaml)
        df.dateFormat = "HH:mm"
        time = df.string(from: date)
        windSpeed = "\(weather.windSpeed)"
        
        switch weather.windDirection! {
        case .north: windDirection = "Noth"; break
        case .south: windDirection = "South"; break
        case .west: windDirection = "West"; break
        case .east: windDirection = "East"; break
        }
        
        switch weather.precipition! {
        case .cloudly: precipition = "Cloudly"; break;
        case .rainy: precipition = "Rainy"; break;
        case .snow: precipition = "Snow"; break;
        case .stormly: precipition = "Stormly"; break;
        case .sunny: precipition = "Sunny"; break;
        case .thunderly: precipition = "Thunderly"; break;
        }
        
    }
}
