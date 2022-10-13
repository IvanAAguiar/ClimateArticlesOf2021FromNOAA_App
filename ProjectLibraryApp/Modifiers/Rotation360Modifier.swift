//
//  Rotation360Modifier.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 13/10/2022.
//

import SwiftUI

struct Rotation360Modifier: ViewModifier {
    
    @State private var animationAmount = 0.0
    
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                withAnimation (.interpolatingSpring(stiffness: 5, damping: 3)) {
                    animationAmount +=  360
                }
            }
            .rotation3DEffect(.degrees(animationAmount), axis: (x:0, y:1, z:0))
    }
}

extension View {
    func rotation360() -> some View {
        modifier(Rotation360Modifier())
    }
}

