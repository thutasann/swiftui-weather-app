//
//  WeatherView.swift
//  WeatherAppUI
//
//  Created by Thuta sann on 12/12/22.
//

import SwiftUI

struct WeatherView: View {
    
    var body: some View {
        ZStack{
            // MARK: Background
            Color.background
                .ignoresSafeArea()
            
            // MARK: Weather Widgets
            ScrollView(showsIndicators: false) {
                VStack (spacing: 20){
                    ForEach(Forecast.cities) { forecast in
                        WeatherWidget(forecasat: forecast)
                    }
                }
            }
            .safeAreaInset(edge: .top) {
                EmptyView()
                    .frame(height: 110)
            }
        }
        .overlay{
            // MARRK: Custom Navigation Bar
            NavigationBar()
        }
        .navigationBarHidden(true)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
            .preferredColorScheme(.dark)
    }
}
