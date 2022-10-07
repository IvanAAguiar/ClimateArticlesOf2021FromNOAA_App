//
//  FirstWeSplitView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 30/09/2022.
//

import SwiftUI

struct FirstWeSplitView: View {
    
    @State private var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            WeSplitProjectView()
                .tabItem {
                    Image(systemName: "plusminus")
                    if selection != 0 { Text("WeSplit") }
                }
                .tag(0)
            ExplanationView(title: "WeSplit", description: "This project was inspired from HACKING WITH SWIFT. The principle goal is to understand how Form works. The secondary goal is to customize the components and try to simplify the code as it is possible.")
                .tabItem {
                    Image(systemName: "brain.head.profile")
                    if selection != 1 { Text("Explanation") }
                }
                .tag(1)
        }
    }
}

struct FirstWeSplitPageView_Previews: PreviewProvider {
    static var previews: some View {
        FirstWeSplitView()
    }
}
