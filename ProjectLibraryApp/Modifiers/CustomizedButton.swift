//
//  CustomizedButton.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 04/10/2022.
//

import SwiftUI

struct CustomizedButton: ViewModifier {
    
    @State var isPressed = false
    
    func body(content: Content) -> some View {
        content
            .bold()
            .font(.title2)
            .frame(maxWidth: 350, maxHeight: 50, alignment: .center)
            .background(Color.blue.opacity(isPressed ? 0.2 : 1.0))
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .scaleEffect(isPressed ? 1.1 : 1.0)
            .animation(.easeIn(duration: 0.5), value: isPressed)
            .simultaneousGesture(DragGesture(minimumDistance: 0)
                .onChanged({_ in isPressed = true})
                .onEnded({_ in isPressed = false})
                                 )
    }
}

extension View {
    func buttonStyleModifier() -> some View {
        modifier(CustomizedButton())
    }
}
