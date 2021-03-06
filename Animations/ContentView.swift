//
//  ContentView.swift
//  Animations
//
//  Created by Ken Muyesu on 25/12/2021.
//

import SwiftUI

struct ContentView: View {
    
//    let letters = Array("Hello, @citixenken")
//    @State private var enabled = false
//    @State private var dragAmount = CGSize.zero
    
    @State private var isShowingRed = false
    
    var body: some View {
        
        //        //Card gradient
        //        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
        //        //.ignoresSafeArea()
        //            .frame(width: 400, height: 300)
        //            .clipShape(RoundedRectangle(cornerRadius: 20))
        //            .offset(dragAmount)
        //        //.animation(.spring(), value: dragAmount)
        //
        //        //Drag event
        //            .gesture(DragGesture()
        //                        .onChanged { dragAmount = $0.translation }
        //                     //.onEnded { _ in dragAmount = .zero }
        //                        .onEnded { _ in
        //                            withAnimation(.spring()) {
        //                                dragAmount = .zero
        //                            }
        //            }
        //            )
        
//        HStack(spacing: 0){
//            ForEach(0..<letters.count) { num in
//                Text(String(letters[num]))
//                    .padding(5)
//                    .font(.title)
//                    .background(enabled ? .blue : .red)
//                    .offset(dragAmount)
//                    .animation(.default.delay(Double(num) / 20), value: dragAmount)
//            }
//            .gesture(
//                DragGesture()
//                    .onChanged { dragAmount = $0.translation }
//                    .onEnded { _ in
//                        dragAmount = .zero
//                        enabled.toggle()
//                    }
//            )
//        }
        
//        VStack {
//            Button("Tap here!") {
//                withAnimation (.spring()){
//                    isShowingRed.toggle()
//                }
//            }
//
//            if isShowingRed {
//                Rectangle()
//                    .fill(.green)
//                    .frame(width: 200, height: 200)
//                    //.transition(.scale)
//                    //.transition(.asymmetric(insertion: .scale, removal: .opacity))
//                    .transition(.pivot)
//            }
//        }
        
        ZStack {
            Rectangle()
                .fill(.mint)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
            
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
        
            //when the view rotates, parts lying outside natural rectangle don't get drawn
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: 0, anchor: .topLeading),
                  identity: CornerRotateModifier(amount: -90, anchor: .topLeading)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
