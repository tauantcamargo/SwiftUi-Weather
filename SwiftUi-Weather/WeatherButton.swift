//
//  WeatherButton.swift
//  SwiftUi-Weather
//
//  Created by Tauan Camargo on 05/04/23.
//

import SwiftUI

struct WeatherButton: View {
    var buttonText: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(buttonText)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 18, weight: .bold))
            .cornerRadius(10)
    }
}
