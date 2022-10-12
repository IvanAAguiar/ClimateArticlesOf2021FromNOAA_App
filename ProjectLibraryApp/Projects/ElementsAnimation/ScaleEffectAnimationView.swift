//
//  ScaleEffectAnimationView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 12/10/2022.
//

import SwiftUI

struct ScaleEffectAnimationView: View {
    
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
             animationAmount += 1
        }
        .padding(50)
        .background(LinearGradient(colors: [.yellow, .red], startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Circle())
        .shadow(radius: 10)
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                    .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }
        .draging()
    }
}

struct ScaleEffectAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ScaleEffectAnimationView()
    }
}
