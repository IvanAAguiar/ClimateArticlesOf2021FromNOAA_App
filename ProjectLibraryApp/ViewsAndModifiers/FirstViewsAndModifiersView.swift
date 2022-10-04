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
                    if selection != 0 { Text("Grid") }
                }
                .tag(0)
            GeometryReaderAnimationView()
                .tabItem {
                    Image(systemName: "r.joystick")
                    if selection != 1 { Text("GeoReader") }
                }
                .tag(1)
            ExplanationView(title: "Views And Modifiers", description: "This project was inspired from HACKING WITH SWIFT. The principle goal is to understand how GeometryReader and LazyVGrid work. The second goal is review @State, customized itens, random itens, arrays and ForEachs.")
                .tabItem {
                    Image(systemName: "brain.head.profile")
                    if selection != 2 { Text("Explanation") }
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
