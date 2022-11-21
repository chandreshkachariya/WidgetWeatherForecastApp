//
//  WeatherEntry.swift
//  WeatherForecastWidgetsExtension
//
//  Created by Chandresh Kachariya on 18/10/22.
//  Copyright © 2022 Muhammad Osama Naeem. All rights reserved.
//

import WidgetKit

struct WeatherEntry: TimelineEntry {
    let date: Date
    let weatherInfo: WeatherModel
    
    static func mockWeatherEntry() -> WeatherEntry {
        return WeatherEntry(date: Date(), weatherInfo: WeatherModel(weather: [Weather(id: 802, main: "Clouds", description: "scattered clouds", icon: "img_weather")], main: Main(temp: 305.14, feels_like: 312.12, temp_min: 305.14, temp_max: 305.14, pressure: 1008, humidity: 66), sys: Sys(country: "IN", sunrise: 1666055100, sunset: 1666096947), name: "Surat", dt: 1666085700, timezone: 19800, dt_txt: "stations"))
    }
}
