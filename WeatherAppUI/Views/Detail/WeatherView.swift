//
//  WeatherView.swift
//  WeatherAppUI
//
//  Created by Thuta sann on 12/12/22.
//

import SwiftUI

struct WeatherView: View {
    
    @State private var searchText = ""
    
    // MARK: SEARCH FILTER
    var searchResults: [Forecast] {
        if searchText.isEmpty{
            return Forecast.cities
        }
        else {
            return Forecast.cities.filter { $0.location.contains(searchText) }
        }
    }
    
    var body: some View {
        ZStack{
            // MARK: Background
            Color.background
                .ignoresSafeArea()
            
            // MARK: Weather Widgets
            ScrollView(showsIndicators: false) {
                VStack (spacing: 20){
                    ForEach(searchResults) { forecast in
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
             NavigationBar(searchText: $searchText)
        }
         .navigationBarHidden(true)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for a city of Airpot")
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            WeatherView()
                .preferredColorScheme(.dark)
        }
    }
}
