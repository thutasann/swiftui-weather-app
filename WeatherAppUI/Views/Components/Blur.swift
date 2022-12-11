//
//  Blur.swift
//  WeatherAppUI
//
//  Created by Thuta sann on 12/11/22.
//

import SwiftUI

// MARK: UI Backdrop view
class UIBackDropView: UIView{
    override class var layerClass: AnyClass{
        NSClassFromString("CABackdropLayer") ?? CALayer.self
    }
}

// MARK: Backdrop
struct Backdrop : UIViewRepresentable{
    
    // makeUI View
    func makeUIView(context: Context) -> UIBackDropView {
        UIBackDropView()
    }
    
    // updateUIView
    func updateUIView(_ uiView: UIViewType, context: Context) {} // <-- doesn't need to update UI
    
}

struct Blur: View {
    
    var radius: CGFloat = 3
    var opaque: Bool = false
    
    var body: some View {
        Backdrop()
            .blur(radius: radius, opaque: opaque)
    }
}

struct Blur_Previews: PreviewProvider {
    static var previews: some View {
        Blur()
    }
}
