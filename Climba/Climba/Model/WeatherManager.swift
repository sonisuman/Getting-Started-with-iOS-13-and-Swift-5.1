//
//  WeatherManager.swift
//  Climba
//
//  Created by Soni Suman on 23/05/21.
//

import Foundation

protocol WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager,_ weather:WeatherModel)
    func didFailedWithError(error: Error?)
}

struct  WeatherManager {
    
    var delegate: WeatherManagerDelegate?
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=08047c9ec8d8c5c5c9ac2e0b6e79b8d9&units=metric"
    
    func featchWeather(_ cityName: String) {
        let finalURL = "\(weatherURL)&q=\(cityName)"
        print(finalURL)
        performRequest(with: finalURL)
    }
    
    func performRequest(with urlString:String) {
        
        // 1) create url
        if let url = URL(string: urlString) {
            
            //2) create url session
            let session = URLSession(configuration: .default)
            
            //give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                
                if error != nil {
                    delegate?.didFailedWithError(error: error)
                    print(error!)
                    return
                }
                
                if let data = data {
                    if let weatherData = self.parseData(data) {
                        delegate?.didUpdateWeather(self, weatherData)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseData(_ weatherData: Data) -> WeatherModel? {
        do {
            let decodabelData =  try JSONDecoder().decode(WeatherData.self, from: weatherData)
            let id = decodabelData.weather[0].id
            let cityName = decodabelData.name
            let temperature = decodabelData.main.temp
            
            let weather = WeatherModel(conditionId: id, cityName: cityName, temperature: temperature)
            return weather
            
        } catch {
            delegate?.didFailedWithError(error: error)
            print(error)
            return nil
        }
    }
}
