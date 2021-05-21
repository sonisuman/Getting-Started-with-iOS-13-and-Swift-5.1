//
//  WeatherManager.swift
//  Climba
//
//  Created by Soni Suman on 30/08/20.
//  Copyright © 2020 Soni Suman. All rights reserved.
//

import Foundation
struct weatherManager {
    let weatherURL = "api.openweathermap.org/data/2.5/weather?&appid=08047c9ec8d8c5c5c9ac2e0b6e79b8d9&units=matric"
    
    func fatchWeather(cityName : String) {
        let URL = "\(weatherURL)&?q\(cityName)"
        print(URL)
    }
}
