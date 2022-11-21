//
//  Provider.swift
//  ForecastWidgetsExtensionExtension
//
//  Created by Chandresh Kachariya on 19/10/22.
//  Copyright © 2022 Muhammad Osama Naeem. All rights reserved.
//

import WidgetKit
import SwiftUI
import CoreLocation

struct Provider: TimelineProvider {
    let loader: WeatherNetworkManager = WeatherNetworkManager()
    typealias Entry = ForecastEntry
    
    func placeholder(in context: Context) -> ForecastEntry {
        ForecastEntry.mockWeatherEntry()
    }

    func getSnapshot(in context: Context, completion: @escaping (ForecastEntry) -> ()) {
        let entry = ForecastEntry.mockWeatherEntry()
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
       
        let getLocation = GetLocation()
        getLocation.run {
            if let location = $0 {
                print("location = \(location.coordinate.latitude) \(location.coordinate.longitude)")
                
                loader.fetchCurrentLocationWeather(lat: "\(location.coordinate.latitude)",
                                                   lon: "\(location.coordinate.longitude)") { weather in
                    
                    loader.fetchNextFiveWeatherForecast(city: weather.name ?? "") { forecast in
                        let currentDate = Date()
                        let entry = ForecastEntry(date: Date(), forecastTemperature: forecast, weatherInfo: weather)
                        let refreshDate = Calendar.current.date(byAdding: .minute, value: 60, to: currentDate)!
                        let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
                        completion(timeline)
                    }
                }
                
                
                
            } else {
                print("Get Location failed \(getLocation.didFailWithError)")
                
            }
        }
    }
}
