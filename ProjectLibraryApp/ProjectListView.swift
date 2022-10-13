//
//  ProjectListView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 30/09/2022.
//

import SwiftUI

struct ProjectListView: View {
    var body: some View {
        List {
            NavigationLink("WeSplit", destination: WeSplitProjectView())
            NavigationLink("Climate Articles", destination: ClimateArticlesView())
            NavigationLink("Guess The Flag", destination: GuessTheFlagView())
            NavigationLink("Views And Modifiers", destination: ViewsModifierView())
            NavigationLink("BetterRest", destination: BetterRestView())
            NavigationLink("Word Scramble", destination: WordScrambleView())
            NavigationLink("Animation", destination: AnimationProjectView())
            NavigationLink("iExpense", destination: ExpenseManagerView())
        }
        .navigationTitle("Projects")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProjectListView()
        }
    }
}
