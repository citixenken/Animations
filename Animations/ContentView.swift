//
//  ContentView.swift
//  Animations
//
//  Created by Ken Muyesu on 25/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount = 0.0
    
    var body: some View {
        
        Button("Tap here!") {
            withAnimation(.interpolatingSpring(stiffness: 50, damping: 1)) {
                animationAmount += 360
            }
        }
        .padding(40)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
