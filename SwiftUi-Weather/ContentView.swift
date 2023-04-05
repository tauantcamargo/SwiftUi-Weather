//
//  ContentView.swift
//  SwiftUi-Weather
//
//  Created by Tauan Camargo on 04/04/23.
//

import SwiftUI

struct ContentView: View {
    var weekWeather: [DayWeather] = []
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
                CityText(cityName: "Anápolis, GO")
                
                TodayCurrentWeather(
                    isNight: $isNight,
                    currentWeather: weekWeather.first?.temperature ?? 30)
                
                HStack(spacing: 20) {
                    ForEach(weekWeather) { day in
                        WeatherDayView(
                            dayOfWeek: day.weekDay,
                            imageName: day.image,
                            temperature: day.temperature)
                    }
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(
                        buttonText: "Change Day Time",
                        textColor: isNight ? .black : .blue,
                        backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(weekWeather: WeekList.allWeather)
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
    @Binding var isNight: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
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
    @Binding var isNight: Bool
    var currentWeather: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Image(systemName: isNight ? "cloud.moon.fill" : "cloud.sun.fill")
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
