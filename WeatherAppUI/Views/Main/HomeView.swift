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
    
    // Bottom Sheet Position
    @State var bottomSheetPosition: BottomSheetPosition = .middle
    
    // To Get the BottomSheet Raw Value
    @State var bottomSheetTranslation: CGFloat = BottomSheetPosition.middle.rawValue
    
    // To Check Dragged Or Not
    @State var hasDragged: Bool = false
    
    // Computed Property for animation
    var bottomSheetTranslationProrated: CGFloat{
        (bottomSheetTranslation - BottomSheetPosition.middle.rawValue) /
        (BottomSheetPosition.top.rawValue - BottomSheetPosition.middle.rawValue)
    }
    
    
    var body: some View {
        NavigationView {
            GeometryReader{ geometry in
                
                let screenHeight = geometry.size.height + geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom // <-- Screen Height
                
                let imageOffset = screenHeight + 36 // <-- Image Offset for Parallax Animation
                
                ZStack{
                    
                    // MARK: Background Color
                    Color.background
                        .ignoresSafeArea()
                    
                    // MARK: Background Image
                    Image("Background")
                        .resizable()
                        .ignoresSafeArea()
                        .offset(y: -bottomSheetTranslationProrated * imageOffset)
                    
                    // MARK: House Image
                    Image("House")
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.top, 257)
                        .offset(y: -bottomSheetTranslationProrated * imageOffset)
                    
                    // MARK: Hero Texts
                    VStack (spacing: -10 * (1 - bottomSheetTranslationProrated)){
                        Text("Montreal")
                            .font(.largeTitle)
                        
                        VStack{
                            Text(attributedString)
                            Text("H:24º   L:38º")
                                .font(.title3.weight(.semibold))
                                .opacity(1 - bottomSheetTranslationProrated) // Opacity 0 onDrag
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 51)
                    .offset(y: -bottomSheetTranslationProrated * 46)
                    
                    // MARK: - BOTTOM SHEET PACKAGE
                    BottomSheetView(position: $bottomSheetPosition) {
                        //Text(bottomSheetTranslationProrated.formatted())
                    } content: {
                        ForecastView(bottomSheetTranslationProrated: bottomSheetTranslationProrated)
                    }
                    .onBottomSheetDrag { translation in
                        bottomSheetTranslation = translation / screenHeight
                        
                        withAnimation(.easeInOut) {
                            if bottomSheetPosition == BottomSheetPosition.top {
                                hasDragged = true
                            } else{
                                hasDragged = false
                            }
                        }
                    }

                    
                    // MARK: TabBar
                    TabBar(action: {
                        bottomSheetPosition = .top
                    })
                    .offset(y: bottomSheetTranslationProrated * 115)
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    // MARK: - Attributed String
    private var attributedString: AttributedString{
        var string = AttributedString("19º" + (hasDragged ? " | " : "\n ") + "Mostly Clear")
        
        // Temp
        if let temp = string.range(of: "19º"){
            string[temp].font = .system(size: (96 - (bottomSheetTranslationProrated *  (96 - 20))), weight: hasDragged ? .semibold : .thin)
            string[temp].foregroundColor = hasDragged ? .secondary : .primary
        }
        
        // Pipe
        if let pipe = string.range(of: " | "){
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary.opacity(bottomSheetTranslationProrated)
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
