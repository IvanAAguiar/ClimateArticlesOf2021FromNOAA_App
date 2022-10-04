//
//  FirstViewsAndModifiersView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 04/10/2022.
//

import SwiftUI

struct FirstViewsAndModifiersView: View {
    
    @State private var selection: Int = 0
    
    var body: some View {
        TabView (selection: $selection) {
            GridMaginificationEffectView()
                .tabItem {
                    Image(systemName: "circle.square.fill")
                    Text("Grid")
                }
                .tag(0)
            GeometryReaderAnimationView()
                .tabItem {
                    Image(systemName: "r.joystick")
                    Text("GeoReader")
                }
            ExplanationView(title: "Views And Modifiers", description: "")
                .tabItem {
                    Image(systemName: "brain.head.profile")
                    Text("Explanation")
                }
                .tag(2)
        }
    }
}

struct FirstViewsAndModifiersView_Previews: PreviewProvider {
    static var previews: some View {
        FirstViewsAndModifiersView()
    }
}
