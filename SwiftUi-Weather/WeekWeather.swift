//
//  WeekWeather.swift
//  SwiftUi-Weather
//
//  Created by Tauan Camargo on 05/04/23.
//

import Foundation

struct DayWeather: Identifiable {
    var id = UUID()
    var weekDay: String
    var image: String
    var temperature: Int
    
    init(weekDay: String, image: String, temperature: Int) {
        self.weekDay = weekDay
        self.image = image
        self.temperature = temperature
    }
}

struct WeekList {
    static let allWeather = [
        DayWeather(weekDay: "MON", image: "cloud.sun.fill", temperature: 30),
        DayWeather(weekDay: "TUE", image: "sun.max.fill", temperature: 40),
        DayWeather(weekDay: "WED", image: "wind.snow", temperature: 20),
        DayWeather(weekDay: "THU", image: "sunset.fill", temperature: 22),
        DayWeather(weekDay: "FRI", image: "snow", temperature: 10),
    ]
}
