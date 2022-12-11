//
//  ForecaseView.swift
//  WeatherAppUI
//
//  Created by Thuta sann on 12/11/22.
//

import SwiftUI

struct ForecastView: View {
    var body: some View {
        ScrollView{
            
        }
        .backgroundBlur(radius: 25, opaque: true)
        .background(Color.bottomSheetBackground)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        .overlay{
            // MARK: BottomSheet Inner Shadow (Border)
            RoundedRectangle(cornerRadius: 44)
                .stroke(.white, lineWidth: 1)
                .blendMode(.overlay)
                .offset(y: 1)
                .blur(radius: 0)
                .mask{
                    RoundedRectangle(cornerRadius: 44)
                }
        }
        .overlay{
            // MARK: BottomSheet Separator
            Divider()
                .blendMode(.overlay)
                .background(Color.bottomSheetBorderTop)
                .frame(maxHeight: .infinity, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 44))
        }
        .overlay{
            // MARK: Drag Indicator
            RoundedRectangle(cornerRadius: 10)
                .fill(.black.opacity(0.3))
                .frame(width: 48, height: 5)
                .frame(height: 20)
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

struct ForecaseView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
            .background(Color.background)
            .preferredColorScheme(.dark)
    }
}
