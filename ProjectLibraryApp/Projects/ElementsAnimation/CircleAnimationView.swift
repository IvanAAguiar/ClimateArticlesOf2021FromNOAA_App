//
//  CircleAnimationView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 12/10/2022.
//

import SwiftUI

struct CircleAnimationView: View {
    
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
            withAnimation (.interpolatingSpring(stiffness: 5, damping: 1)) {
                animationAmount +=  360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .shadow(color: .black, radius: 5)
        .rotation3DEffect(.degrees(animationAmount), axis: (x:0, y:1, z:0))
        .draging()
    }
}

struct CircleAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleAnimationView()
    }
}
