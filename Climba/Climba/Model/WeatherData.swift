//
//  WeatherData.swift
//  Climba
//
//  Created by Soni Suman on 26/05/21.
//

import Foundation
struct WeatherData: Decodable {
    let name : String
    let main: Main
    let weather: [Weather]
}
struct Main: Decodable {
    let temp : Double
}
struct Weather: Decodable {
    let description : String
    let id: Int
}
