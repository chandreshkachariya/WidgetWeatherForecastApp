//
//  Provider.swift
//  WeatherForecastWidgetsExtension
//
//  Created by Chandresh Kachariya on 18/10/22.
//  Copyright © 2022 Muhammad Osama Naeem. All rights reserved.
//

import WidgetKit
import CoreLocation
import SwiftUI

struct Provider: TimelineProvider {
    let loader: WeatherNetworkManager = WeatherNetworkManager()
    typealias Entry = WeatherEntry
    @Environment(\.widgetFamily) var family
    
    func placeholder(in context: Context) -> WeatherEntry {
        WeatherEntry.mockWeatherEntry()
    }

    func getSnapshot(in context: Context, completion: @escaping (WeatherEntry) -> ()) {
        let entry = WeatherEntry.mockWeatherEntry()
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {

        switch family {
                case .systemSmall:
                    print("systemSmall")
                    loadSmallUI(completion: { timeline in
                        completion(timeline)
                    })

                case .systemMedium:
                    print("systemMedium")
                    loadMediumUI(completion: { timeline in
                        completion(timeline)
                    })

                default:
                    fatalError()

                }
        
//        loader.fetchCurrentWeather(city: "Surat") { weather in
//            let currentDate = Date()
//            let entry = WeatherEntry(date: Date(), weatherInfo: weather )
//            let refreshDate = Calendar.current.date(byAdding: .minute, value: 60, to: currentDate)!
//            let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
//            completion(timeline)
//        }
        
    }
    
    private func loadSmallUI(completion: @escaping (Timeline<Entry>) -> ()) {
        let getLocation = GetLocation()
        getLocation.run {
            if let location = $0 {
                print("location = \(location.coordinate.latitude) \(location.coordinate.longitude)")
                
                loader.fetchCurrentLocationWeather(lat: "\(location.coordinate.latitude)",
                                                   lon: "\(location.coordinate.longitude)") { weather in
                    
                    let currentDate = Date()
                    let entry = WeatherEntry(date: Date(), weatherInfo: weather )
                    let refreshDate = Calendar.current.date(byAdding: .minute, value: 60, to: currentDate)!
                    let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
                    completion(timeline)
                }
            } else {
                print("Get Location failed \(getLocation.didFailWithError)")
                
            }
        }
    }
    
    private func loadMediumUI(completion: @escaping (Timeline<Entry>) -> ()) {
        let getLocation = GetLocation()
        getLocation.run {
            if let location = $0 {
                print("location = \(location.coordinate.latitude) \(location.coordinate.longitude)")
                
                loader.fetchCurrentLocationWeather(lat: "\(location.coordinate.latitude)",
                                                   lon: "\(location.coordinate.longitude)") { weather in
                    
                    let currentDate = Date()
                    let entry = WeatherEntry(date: Date(), weatherInfo: weather )
                    let refreshDate = Calendar.current.date(byAdding: .minute, value: 60, to: currentDate)!
                    let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
                    completion(timeline)
                }
            } else {
                print("Get Location failed \(getLocation.didFailWithError)")
                
            }
        }
    }
}
