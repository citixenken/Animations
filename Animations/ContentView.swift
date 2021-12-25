//
//  ContentView.swift
//  Animations
//
//  Created by Ken Muyesu on 25/12/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var animationsAmount = 1.0
    
    var body: some View {
        Button("Tap here!") {
            //increases button's animation by one everytime its tapped
            animationsAmount += 0.5
        }
        .padding(50)
        .background(.mint)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationsAmount)
        .blur(radius: (animationsAmount - 1) * 3)
        
        //smooth transition
        .animation(.default, value: animationsAmount)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
