//
//  ProjectListView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 30/09/2022.
//

import SwiftUI

struct ProjectListView: View {
    var body: some View {
        Form {
            NavigationLink("WeSplit", destination: FirstWeSplitView())
            NavigationLink("Climate Articles", destination: FirstClimateArticlesView())
            NavigationLink("Guess The Flag", destination: FirstGuessTheFlagView())
            NavigationLink("Views And Modifiers", destination: FirstViewsAndModifiersView())
            NavigationLink("BetterRest", destination: FirstBetterRestView())
        }
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView()
    }
}
