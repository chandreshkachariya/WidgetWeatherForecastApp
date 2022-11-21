//
//  ForecastWidgetsExtension.swift
//  ForecastWidgetsExtension
//
//  Created by Chandresh Kachariya on 19/10/22.
//  Copyright © 2022 Muhammad Osama Naeem. All rights reserved.
//

import WidgetKit
import SwiftUI

struct ForecastWidgetsExtensionEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        FWMediumView(_forecastEntry: entry)
    }
}

@main
struct ForecastWidgetsExtension: Widget {
    let kind: String = "ForecastWidgetsExtension"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            ForecastWidgetsExtensionEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium])
    }
}

struct ForecastWidgetsExtension_Previews: PreviewProvider {
    static var previews: some View {
        ForecastWidgetsExtensionEntryView(entry: ForecastEntry.mockWeatherEntry())
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
