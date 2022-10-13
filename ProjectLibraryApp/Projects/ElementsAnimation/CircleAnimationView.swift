//
//  CircleAnimationView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 12/10/2022.
//

import SwiftUI

struct CircleAnimationView: View {
        
    var body: some View {
        Text("Tap Me")
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .shadow(color: .black, radius: 5)
        .rotation360()
        .draging()
    }
}

struct CircleAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleAnimationView()
    }
}
