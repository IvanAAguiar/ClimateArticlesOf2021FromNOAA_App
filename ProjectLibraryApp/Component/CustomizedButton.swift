//
//  CustomizedButton.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 04/10/2022.
//

import SwiftUI

struct CustomizedButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .bold()
            .font(.title2)
            .frame(width: 350, height: 50, alignment: .center)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(10)
    }
}

extension View {
    func ButtonCustomizedStyle() -> some View {
        modifier(CustomizedButton())
    }
}
