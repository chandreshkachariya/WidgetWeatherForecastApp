//
//  WeatherForecastWidgets.swift
//  WeatherForecastWidgets
//
//  Created by Chandresh Kachariya on 18/10/22.
//  Copyright © 2022 Muhammad Osama Naeem. All rights reserved.
//

import WidgetKit
import SwiftUI

struct WeatherForecastWidgetsEntryView : View {
    var entry: Provider.Entry

    @Environment(\.widgetFamily) var family

    @ViewBuilder
    var body: some View {
        switch family {
            case .systemSmall:
                WWSmallView(_weather: entry.weatherInfo)

            case .systemMedium:
                WWMediumView(_weather: entry.weatherInfo)

            default:
                fatalError()

            }
    }
    
}

@main
struct WeatherForecastWidgets: Widget {
    let kind: String = "WeatherForecastWidgets"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WeatherForecastWidgetsEntryView(entry: entry)
        }
        .configurationDisplayName("My Weather Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct WeatherForecastWidgets_Previews: PreviewProvider {
    static var previews: some View {
        WeatherForecastWidgetsEntryView(entry: WeatherEntry.mockWeatherEntry())
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
