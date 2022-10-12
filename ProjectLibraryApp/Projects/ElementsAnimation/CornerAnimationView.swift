//
//  CornerAnimationView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 12/10/2022.
//

import SwiftUI

struct CornerAnimationView: View {
    
    @State private var enabled = false

    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 100)
        .background(enabled ? .blue : .red)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
        .shadow(color: .black, radius: 5)
        .draging()
    }
}

struct CornerAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CornerAnimationView()
    }
}
