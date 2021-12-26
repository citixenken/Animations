//
//  ContentView.swift
//  Animations
//
//  Created by Ken Muyesu on 25/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    //@State private var animationAmount = 0.0
    @State private var enabled = false
    
    var body: some View {
        VStack{
            Button("Tap here!") {
//                withAnimation(.interpolatingSpring(stiffness: 50, damping: 1)) {
//                    animationAmount += 360
//                }
                enabled.toggle()
            }
            //.padding(40)
            .frame(width: 200, height: 200)
            .background(enabled ? .red : .blue)
            .animation(nil, value: enabled)
            .foregroundColor(.white)
            //.clipShape(Circle())
            
            //.rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
            .clipShape(RoundedRectangle(cornerRadius: enabled ? 60: 0))
            .animation(.interpolatingSpring(stiffness: 50, damping: 2), value: enabled)
            //.clipShape(RoundedRectangle(cornerRadius: enabled ? 60: 0))
            
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
