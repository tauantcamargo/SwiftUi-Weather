//
//  ContentView.swift
//  SwiftUi-Weather
//
//  Created by Tauan Camargo on 04/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(gradientColors: [.blue, Color("lightBlue")])
            
            VStack {
                CityText(cityName: "Anápolis, GO")
                
                TodayCurrentWeather(
                    currentWeatherImage: "cloud.sun.fill",
                    currentWeather: "23")
                
                HStack(spacing: 20) {
                    WeatherDayView(
                        dayOfWeek: "MON",
                        imageName: "cloud.sun.fill",
                        temperature: 30)
                    
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        imageName: "sun.max.fill",
                        temperature: 40)
                    
                    WeatherDayView(
                        dayOfWeek: "WED",
                        imageName: "wind.snow",
                        temperature: 20)
                    
                    WeatherDayView(
                        dayOfWeek: "THU",
                        imageName: "sunset.fill",
                        temperature: 22)
                    
                    WeatherDayView(
                        dayOfWeek: "FRI",
                        imageName: "snow",
                        temperature: 10)
                }
                Spacer()
                
                Button {
                    print("tapped")
                } label: {
                    WeatherButton(
                        buttonText: "Change Day Time",
                        textColor: .blue,
                        backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 2) {
            Text("\(dayOfWeek)")
                .font(.system(size: 19, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: "\(imageName)")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var gradientColors: [Color]
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: gradientColors),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityText: View {
    var cityName: String
    var body: some View {
        Text("\(cityName)")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct TodayCurrentWeather: View {
    var currentWeatherImage: String
    var currentWeather: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Image(systemName: "\(currentWeatherImage)")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(currentWeather)°")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
        .padding(.bottom, 50)
    }
}
