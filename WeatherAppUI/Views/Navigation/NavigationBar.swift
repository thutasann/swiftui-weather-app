//
//  NavigationBar.swift
//  WeatherAppUI
//
//  Created by Thuta sann on 12/12/22.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        VStack (spacing: 8){
            HStack{
                // MARK: Back Button
                Button{
                    
                } label: {

                    HStack (spacing: 5){
                        Image(systemName: "chevron.left")
                            .font(.system(size: 23).weight(.medium))
                            .foregroundColor(.secondary)
                        Text("Weather")
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                    .frame(height: 52)
                }
                
                Spacer()
                
                // MARK: More button
                Image(systemName: "ellipsis.circle")
                    .font(.system(size: 28))
                    .frame(width: 44, height: 44, alignment: .trailing )
            }
            .frame(height: 52)
        }
        .frame(height: 106, alignment: .top)
        .padding(.horizontal, 16)
        .padding(.top, 49)
        .backgroundBlur(radius: 20, opaque: true)
        .background(Color.navBarBackground)
        .frame(maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea()
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
