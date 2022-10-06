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
            ViewsModifierView()
                .tabItem {
                    Image(systemName: "iphone.and.arrow.forward")
                    if selection != 0 { Text("Modifier") }
                }
                .tag(0)
            GridMaginificationEffectView()
                .tabItem {
                    Image(systemName: "circle.square.fill")
                    if selection != 1 { Text("Grid") }
                }
                .tag(1)
            GeometryReaderAnimationView()
                .tabItem {
                    Image(systemName: "r.joystick")
                    if selection != 2 { Text("GeoReader") }
                }
                .tag(2)
            ExplanationView(title: "Views And Modifiers", description: "This project was inspired from HACKING WITH SWIFT. The principle goal is to understand how GeometryReader and LazyVGrid work. The second goal is review @State, customized itens, random itens, arrays and ForEachs.")
                .tabItem {
                    Image(systemName: "brain.head.profile")
                    if selection != 3 { Text("Explanation") }
                }
                .tag(3)
        }
    }
}

struct FirstViewsAndModifiersView_Previews: PreviewProvider {
    static var previews: some View {
        FirstViewsAndModifiersView()
    }
}
