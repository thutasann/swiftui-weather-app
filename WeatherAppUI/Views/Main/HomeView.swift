//
//  HomeView.swift
//  WeatherAppUI
//
//  Created by Thuta sann on 12/11/22.
//

import SwiftUI
import BottomSheet

// MARK: BottoomSheet Position Enum
enum BottomSheetPosition: CGFloat, CaseIterable{
    case top = 0.83 // 702/844
    case middle = 0.385 // 325/844
}

struct HomeView: View {
    
    @State var bottomSheetPosition: BottomSheetPosition = .middle
    // To Get the BottomSheet Raw Value
    @State var bottomSheetTranslation: CGFloat = BottomSheetPosition.middle.rawValue
    
    // Computed Property for animation
    var bottomSheetTranslationProrated: CGFloat{
        (bottomSheetTranslation - BottomSheetPosition.middle.rawValue) /
        (BottomSheetPosition.top.rawValue - BottomSheetPosition.middle.rawValue)
    }
    
    
    var body: some View {
        NavigationView {
            GeometryReader{ geometry in
                
                let screenHeight = geometry.size.height + geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom // <-- Screen Height
                
                ZStack{
                    
                    // MARK: Background Color
                    Color.background
                        .ignoresSafeArea()
                    
                    // MARK: Background Image
                    Image("Background")
                        .resizable()
                        .ignoresSafeArea()
                    
                    // MARK: House Image
                    Image("House")
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.top, 257)
                    
                    // MARK: Hero Texts
                    VStack (spacing: -10){
                        Text("Montreal")
                            .font(.largeTitle)
                        
                        VStack{
                                            
                            Text(attributedString)
                            
                            Text("H:24º   L:18º")
                                .font(.title3.weight(.semibold))
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 51)
                    
                    // MARK: - BOTTOM SHEET PACKAGE
                    BottomSheetView(position: $bottomSheetPosition) {
                        Text(bottomSheetTranslationProrated.formatted())
                    } content: {
                        ForecastView()
                    }
                    .onBottomSheetDrag { translation in
                        bottomSheetTranslation = translation / screenHeight
                    }

                    
                    // MARK: TabBar
                    TabBar(action: {
                        bottomSheetPosition = .top
                    })
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    // MARK: - Attributed String
    private var attributedString: AttributedString{
        var string = AttributedString("19º" + "\n " + "Mostly Clear")
        
        // Temp
        if let temp = string.range(of: "19º"){
            string[temp].font = .system(size: 96, weight: .thin)
            string[temp].foregroundColor = .primary
        }
        
        // Pipe
        if let pipe = string.range(of: " | "){
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary
        }
        
        // Weather
        if let weather = string.range(of: "Mostly Clear"){
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
        }
        return string
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
