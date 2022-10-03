//
//  FirstGuessTheFlagView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 03/10/2022.
//

import SwiftUI

struct FirstGuessTheFlagView: View {
    
    @State private var selection: Int = 0
    
    var body: some View {
        TabView (selection: $selection) {
            GuessTheFlagProjectView()
                .tabItem {
                    Image(systemName: "flag")
                    Text("WeSplit")
                }
                .tag(0)
            ExplanationGuessTheFlagView()
                .tabItem {
                    Image(systemName: "brain.head.profile")
                    Text("Explanation")
                }
                .tag(1)
        }
    }
}

struct FirstGuessTheFlagView_Previews: PreviewProvider {
    static var previews: some View {
        FirstGuessTheFlagView()
    }
}
