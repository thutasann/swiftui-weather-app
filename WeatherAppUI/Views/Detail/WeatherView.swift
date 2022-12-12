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
    }
}
