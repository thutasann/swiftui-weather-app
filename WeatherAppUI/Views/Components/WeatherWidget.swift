//
//  WeatherWidget.swift
//  WeatherAppUI
//
//  Created by Thuta sann on 12/12/22.
//

import SwiftUI

struct WeatherWidget: View {
    
    var forecasat : Forecast
    
    var body: some View {
        ZStack (alignment: .bottom) {
            // MARK: Trapezoid
            Trapezoid()
                .fill(Color.weatherWidgetBackground)
                .frame(width: 342, height: 174)
            
            // MARK: Content
            HStack (alignment: .bottom ){
                
                // MARK: Content Texts Column
                VStack(alignment: .leading, spacing: 8){
            
                    Text("\(forecasat.temperature)")
                        .font(.system(size: 64))
                    
                    VStack(alignment: .leading, spacing: 2){
        
                        Text("H:\(forecasat.high)° L:\(forecasat.low)°")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        
                        Text(forecasat.location)
                            .font(.body)
                            .lineLimit(1)
                    }
                }
                
                Spacer()
                
                // MARK: Icon Column
                VStack(alignment: .trailing, spacing: 0){
                    Image("\(forecasat.icon) large")
                        .padding(.trailing, 4)
                    
                    Text(forecasat.weather.rawValue)
                        .font(.footnote)
                        .padding(.trailing, 24)
                }
            }
            .foregroundColor(.white)
            .padding(.bottom, 20)
            .padding(.leading, 20)
        }
        .frame(width: 342, height: 184, alignment: .bottom)
    }
}

struct WeatherWidget_Previews: PreviewProvider {
    static var previews: some View {
        WeatherWidget(forecasat: Forecast.cities[0])
            .preferredColorScheme(.dark)
    }
}
