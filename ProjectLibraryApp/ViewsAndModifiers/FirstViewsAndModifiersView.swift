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
            ViewsAndModifiersProjectView()
                .tabItem {
                    Image(systemName: "flag")
                    Text("WeSplit")
                }
                .tag(0)
            ExplanationViewsAndModifiersView()
                .tabItem {
                    Image(systemName: "brain.head.profile")
                    Text("Explanation")
                }
                .tag(1)
        }
    }
}

struct FirstViewsAndModifiersView_Previews: PreviewProvider {
    static var previews: some View {
        FirstViewsAndModifiersView()
    }
}
