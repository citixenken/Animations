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
        print(animationsAmount)
        
        return VStack {
            Stepper("Scale amount: ", value: $animationsAmount.animation(
                .easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
            ), in: 1...5)
            
            Spacer()
            
            Button("Tap here!") {
                animationsAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationsAmount)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
