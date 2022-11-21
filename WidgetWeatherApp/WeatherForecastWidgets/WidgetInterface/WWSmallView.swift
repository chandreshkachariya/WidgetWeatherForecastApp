//
//  WWSmallView.swift
//  WeatherForecastWidgetsExtension
//
//  Created by Chandresh Kachariya on 18/10/22.
//  Copyright © 2022 Muhammad Osama Naeem. All rights reserved.
//

import SwiftUI
import WidgetKit

struct WWSmallView: View {
    private var weather: WeatherModel
    var stringDate = ""
    
        init(_weather: WeatherModel) {
            self.weather = _weather
            
            let formatter = DateFormatter()
            formatter.dateFormat = "dd MMM yyyy" //yyyy
            stringDate = formatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.dt)))
            
        }

        var body: some View {
            VStack(alignment:.leading, spacing:10){

                Text("\(weather.name ?? "") , \(weather.sys.country ?? "")")
                    .font(Font.headline)
                    .foregroundColor(Color.primary)
                
                Text(stringDate).font(.subheadline)
                    .foregroundColor(Color.secondary)

                HStack{
                    RoundedRectangle(cornerRadius: 1)
                        .fill((String(weather.main.temp.kelvinToCeliusConverter()) + "°C") != nil ? Color.green : Color.red)
                        .frame(width: 2, height: 37)
                    Text((String(weather.main.temp.kelvinToCeliusConverter()) + "°C")).font(.title)
                }
            }
        }
}

struct WWSmallView_Previews: PreviewProvider {
    static var previews: some View {
        WWSmallView(_weather: WeatherModel(weather: [Weather(id: 802, main: "Clouds", description: "scattered clouds", icon: "img_weather")], main: Main(temp: 305.14, feels_like: 312.12, temp_min: 305.14, temp_max: 305.14, pressure: 1008, humidity: 66), sys: Sys(country: "IN", sunrise: 1666055100, sunset: 1666096947), name: "Surat", dt: 1666085700, timezone: 19800, dt_txt: "stations"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
