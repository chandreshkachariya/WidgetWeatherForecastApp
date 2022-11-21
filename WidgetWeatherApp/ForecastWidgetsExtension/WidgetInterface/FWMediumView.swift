//
//  FWMediumView.swift
//  ForecastWidgetsExtensionExtension
//
//  Created by Chandresh Kachariya on 19/10/22.
//  Copyright © 2022 Muhammad Osama Naeem. All rights reserved.
//

import SwiftUI
import WidgetKit

struct FWMediumView: View {
    private var forecastEntry: ForecastEntry
    
    let dateFormatterGet = DateFormatter()
    let dateFormatter = DateFormatter()

    init(_forecastEntry: ForecastEntry) {
        self.forecastEntry = _forecastEntry
        
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"

        dateFormatter.dateFormat = "HH:mm"
        
    }
    
    var body: some View {
        ZStack() {
            VStack() {
                VStack() {
                    HStack() {
                        VStack(alignment: .center) {
                            Text("\(forecastEntry.weatherInfo.name ?? "") , \(forecastEntry.weatherInfo.sys.country ?? "")")
                                .font(Font.headline)
                                .foregroundColor(Color.primary)
                            
                            HStack{
                                RoundedRectangle(cornerRadius: 1)
                                    .fill((String(forecastEntry.weatherInfo.main.temp.kelvinToCeliusConverter()) + "°C") != nil ? Color.green : Color.red)
                                    .frame(width: 2, height: 37)
                                Text((String(forecastEntry.weatherInfo.main.temp.kelvinToCeliusConverter()) + "°C")).font(.title)
                            }
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            Image("img_weather")
                            
                            Text("\(forecastEntry.weatherInfo.weather[0].description)")
                                .font(Font.subheadline)
                                .foregroundColor(Color.primary)
                        }
                    }.padding(EdgeInsets(top: 8, leading: 20, bottom: 0, trailing: 20))
                }.padding(EdgeInsets(top: 12, leading: 0, bottom: 0, trailing: 0))
                
                HStack(alignment: .center, spacing: 20) {
                    VStack(alignment: .center) {
                        if let date = self.dateFormatterGet.date(from: forecastEntry.forecastTemperature[0].hourlyForecast?[0].time ?? "") {
                            
                            Text("\(dateFormatter.string(from: date))")
                                .font(.system(size: 12))
                                .foregroundColor(Color.primary)
                        }
                        
                        VStack {
                            let imgName: String = (forecastEntry.forecastTemperature[0].hourlyForecast?[0].icon ?? "")
                            if imgName != "" {
                                Image(uiImage: "http://openweathermap.org/img/wn/\(imgName)@2x.png".load())
                                    .resizable().aspectRatio(1, contentMode: .fit)
                            } else {
                                Image("img_weather")
                            }
                        }.frame(width: 24, height: 24)

                        Text(String(forecastEntry.forecastTemperature[0].hourlyForecast?[0].temp.kelvinToCeliusConverter() ?? 0) + " °C")
                            .font(.system(size: 12))
                            .foregroundColor(Color.primary)
                    }
                                    
                    VStack(alignment: .center) {
                        if let date = self.dateFormatterGet.date(from: forecastEntry.forecastTemperature[0].hourlyForecast?[1].time ?? "") {
                            
                            Text("\(dateFormatter.string(from: date))")
                                .font(.system(size: 12))
                                .foregroundColor(Color.primary)
                        }
                        
                        VStack {
                            let imgName: String = (forecastEntry.forecastTemperature[0].hourlyForecast?[0].icon ?? "")
                            if imgName != "" {
                                Image(uiImage: "http://openweathermap.org/img/wn/\(imgName)@2x.png".load())
                                    .resizable().aspectRatio(1, contentMode: .fit)
                            } else {
                                Image("img_weather")
                            }
                        }.frame(width: 24, height: 24)
                        
                        Text(String(forecastEntry.forecastTemperature[0].hourlyForecast?[1].temp.kelvinToCeliusConverter() ?? 0) + " °C")
                            .font(.system(size: 12))
                            .foregroundColor(Color.primary)
                    }
                                    
                    VStack(alignment: .center) {
                        if let date = self.dateFormatterGet.date(from: forecastEntry.forecastTemperature[0].hourlyForecast?[2].time ?? "") {
                            
                            Text("\(dateFormatter.string(from: date))")
                                .font(.system(size: 12))
                                .foregroundColor(Color.primary)
                        }
                        
                        VStack {
                            let imgName: String = (forecastEntry.forecastTemperature[0].hourlyForecast?[0].icon ?? "")
                            if imgName != "" {
                                Image(uiImage: "http://openweathermap.org/img/wn/\(imgName)@2x.png".load())
                                    .resizable().aspectRatio(1, contentMode: .fit)
                            } else {
                                Image("img_weather")
                            }
                        }.frame(width: 24, height: 24)
                        
                        Text(String(forecastEntry.forecastTemperature[0].hourlyForecast?[2].temp.kelvinToCeliusConverter() ?? 0) + " °C")
                            .font(.system(size: 12))
                            .foregroundColor(Color.primary)
                    }
                                    
                    VStack(alignment: .center) {
                        if let date = self.dateFormatterGet.date(from: forecastEntry.forecastTemperature[0].hourlyForecast?[3].time ?? "") {
                            
                            Text("\(dateFormatter.string(from: date))")
                                .font(.system(size: 12))
                                .foregroundColor(Color.primary)
                        }
                        
                        VStack {
                            let imgName: String = (forecastEntry.forecastTemperature[0].hourlyForecast?[0].icon ?? "")
                            if imgName != "" {
                                Image(uiImage: "http://openweathermap.org/img/wn/\(imgName)@2x.png".load())
                                    .resizable().aspectRatio(1, contentMode: .fit)
                            } else {
                                Image("img_weather")
                            }
                        }.frame(width: 24, height: 24)
                        
                        Text(String(forecastEntry.forecastTemperature[0].hourlyForecast?[3].temp.kelvinToCeliusConverter() ?? 0) + " °C")
                            .font(.system(size: 12))
                            .foregroundColor(Color.primary)
                    }
                                    
                    VStack(alignment: .center) {
                        if (forecastEntry.forecastTemperature[0].hourlyForecast?.count ?? 0) >= 5 {
                            if let date = self.dateFormatterGet.date(from: forecastEntry.forecastTemperature[0].hourlyForecast?[4].time ?? "") {
                                
                                Text("\(dateFormatter.string(from: date))")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.primary)
                            }
                            
                            VStack {
                                let imgName: String = (forecastEntry.forecastTemperature[0].hourlyForecast?[0].icon ?? "")
                                if imgName != "" {
                                    Image(uiImage: "http://openweathermap.org/img/wn/\(imgName)@2x.png".load())
                                        .resizable().aspectRatio(1, contentMode: .fit)
                                } else {
                                    Image("img_weather")
                                }
                            }.frame(width: 24, height: 24)
                            
                            Text(String(forecastEntry.forecastTemperature[0].hourlyForecast?[4].temp.kelvinToCeliusConverter() ?? 0) + " °C")
                                .font(.system(size: 12))
                                .foregroundColor(Color.primary)
                        }
                        
                        
                    }
                }
                .padding(EdgeInsets(top: -8, leading: 0, bottom: 12, trailing: 0))
            }
        }
        .background(Color.white)
        

    }
}

struct FWMediumView_Previews: PreviewProvider {
    static var previews: some View {
        FWMediumView(_forecastEntry: ForecastEntry.mockWeatherEntry()).previewContext(WidgetPreviewContext(family: .systemMedium))
    }    
}

extension String {
    func load() -> UIImage {
        do {
            guard let url  = URL(string: self) else { return UIImage() }
            let data: Data = try Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage()
        } catch {
            
        }
        return UIImage()
    }
}
